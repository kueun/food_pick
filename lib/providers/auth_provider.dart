import 'dart:io';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:food_pic_app/model/user.dart';
import 'package:food_pic_app/services/supabase_service.dart';
import 'package:food_pic_app/config/supabase_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

/// Supabase 클라이언트를 제공하는 Provider
///
/// 앱 전체에서 Supabase 클라이언트에 접근할 수 있도록 합니다.
@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  return SupabaseConfig.client;
}

/// Supabase의 현재 사용자를 제공하는 Provider (Supabase User 객체)
///
/// Supabase Auth의 현재 사용자 정보를 반환합니다.
/// 로그인하지 않은 경우 null을 반환합니다.
@riverpod
User? supabaseUser(SupabaseUserRef ref) {
  // authStateChangesProvider를 watch하여 인증 상태 변경 시 재빌드
  ref.watch(authStateChangesProvider);
  return ref.read(supabaseClientProvider).auth.currentUser;
}

/// 인증 상태 변경 스트림을 제공하는 Provider
///
/// 사용자의 로그인/로그아웃 상태 변화를 실시간으로 감지합니다.
/// 이를 통해 UI가 자동으로 인증 상태에 따라 업데이트됩니다.
@riverpod
Stream<AuthState> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(supabaseClientProvider).auth.onAuthStateChange;
}

/// 현재 로그인 상태(로그인 여부)를 제공하는 Provider
///
/// 사용자가 로그인되어 있으면 true, 아니면 false를 반환합니다.
///
/// 사용 예시:
/// ```dart
/// final isLoggedIn = ref.watch(isLoggedInProvider);
/// ```
@riverpod
bool isLoggedIn(IsLoggedInRef ref) {
  return ref.watch(supabaseUserProvider) != null;
}

/// 인증 상태를 관리하고 인증 관련 작업을 처리하는 Notifier
@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  /// Notifier가 빌드될 때 호출됩니다.
  /// 현재 로그인된 사용자의 프로필 정보를 가져옵니다.
  @override
  Future<UserModel?> build() async {
    // onAuthStateChange 스트림을 수신하여 인증 상태 변경 감지
    ref.listen(authStateChangesProvider, (_, __) => ref.invalidateSelf());

    final supabaseUser = ref.read(supabaseClientProvider).auth.currentUser;
    if (supabaseUser == null) {
      return null;
    }

    final profileService = ref.watch(supabaseServiceProvider);
    var userProfile = await profileService.getUserProfile(uid: supabaseUser.id);

    // 사용자는 인증되었지만 데이터베이스에 프로필이 없는 경우, 새로 생성
    if (userProfile == null) {
      userProfile = await profileService.createUserProfile(
        uid: supabaseUser.id,
        email: supabaseUser.email ?? 'no-email@example.com',
        name: supabaseUser.email?.split('@').first ?? 'New User',
        introduce: '자기소개를 입력해주세요.',
      );
    }
    return userProfile;
  }

  /// 이메일과 비밀번호로 회원가입을 처리합니다.
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String introduce,
    File? profileImage,
  }) async {
    state = const AsyncValue.loading();
    try {
      await ref
          .read(supabaseServiceProvider)
          .signUp(
            email: email,
            password: password,
            name: name,
            introduce: introduce,
            profileImage: profileImage,
          );
      // 성공 시에는 authStateChangesProvider가 이벤트를 보내고
      // 이 provider의 build 메서드가 다시 실행되어 상태를 갱신합니다.
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// 이메일과 비밀번호로 로그인을 처리합니다.
  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncValue.loading();
    try {
      await ref
          .read(supabaseServiceProvider)
          .signIn(email: email, password: password);
      // 성공 시 build 메서드가 자동으로 재실행되어 상태를 갱신
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow; // UI에서 에러를 인지할 수 있도록 rethrow
    }
  }

  /// 로그아웃을 처리합니다.
  Future<void> signOut() async {
    state = const AsyncValue.loading();
    await ref.read(supabaseServiceProvider).signOut();
  }
}
