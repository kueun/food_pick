import 'dart:developer';
import 'dart:io';
import 'package:food_pic_app/config/supabase_config.dart';
import 'package:food_pic_app/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_service.g.dart';

/// Supabase 클라이언트를 제공하는 Provider
@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  assert(SupabaseConfig.client != null, 'SupabaseClient가 초기화되지 않았습니다.');
  return SupabaseConfig.client;
}

/// SupabaseService 인스턴스를 제공하는 Provider
@riverpod
SupabaseService supabaseService(SupabaseServiceRef ref) {
  final client = ref.watch(supabaseClientProvider);
  assert(client != null, 'SupabaseClient Provider가 null입니다.');
  return SupabaseService(client);
}

/// Supabase와의 모든 데이터 상호작용을 관리하는 서비스 클래스
///
/// 인증, 데이터베이스 작업, 파일 스토리지 등 Supabase와 관련된 기능을 제공합니다.
class SupabaseService {
  final SupabaseClient _client;

  SupabaseService(this._client);

  /// UID로 사용자 프로필 정보 조회
  Future<UserModel?> getUserProfile({required String uid}) async {
    try {
      final response =
          await _client.from('users').select().eq('uid', uid).single();
      return UserModel.fromJson(response);
    } catch (e, stackTrace) {
      log(
        '사용자 정보 조회 실패',
        name: 'SupabaseService',
        error: e,
        stackTrace: stackTrace,
      );
      // 사용자가 없거나 조회에 실패한 경우 null 반환
      return null;
    }
  }

  /// 회원가입
  ///
  /// Supabase Auth에 사용자를 생성하고, 스토리지에 프로필 이미지를 업로드한 후,
  /// 'users' 테이블에 사용자 정보를 저장합니다.
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String introduce,
    File? profileImage,
  }) async {
    try {
      final authResponse = await _client.auth.signUp(
        email: email,
        password: password,
      );
      final user = authResponse.user;
      if (user == null) {
        throw const AuthException('회원가입 후 사용자가 생성되지 않았습니다.');
      }

      String? profileUrl;
      if (profileImage != null) {
        profileUrl = await _uploadProfileImage(profileImage, user.id);
      }

      final userModel = UserModel(
        uid: user.id,
        email: email,
        name: name,
        introduce: introduce,
        profileUrl: profileUrl,
      );

      await _client.from('users').insert(userModel.toJson());
    } on AuthException catch (e, stackTrace) {
      log(
        '회원가입 인증 오류',
        name: 'SupabaseService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    } catch (e, stackTrace) {
      log('회원가입 실패', name: 'SupabaseService', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 프로필 이미지 업로드
  Future<String> _uploadProfileImage(File image, String userId) async {
    final fileName = '${userId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final path = 'public/$fileName';

    await _client.storage
        .from(SupabaseBuckets.profileImages)
        .upload(path, image);

    return _client.storage
        .from(SupabaseBuckets.profileImages)
        .getPublicUrl(path);
  }

  /// 이메일과 비밀번호로 로그인
  Future<void> signIn({required String email, required String password}) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw AuthException('로그인에 실패했습니다. 이메일 또는 비밀번호를 확인하세요.');
      }
    } on AuthException catch (e, stackTrace) {
      log(
        '로그인 인증 오류: ${e.message}',
        name: 'SupabaseService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    } catch (e, stackTrace) {
      log('로그인 실패', name: 'SupabaseService', error: e, stackTrace: stackTrace);
      throw Exception('로그인 중 알 수 없는 오류가 발생했습니다.');
    }
  }

  /// 로그아웃
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e, stackTrace) {
      log('로그아웃 실패', name: 'SupabaseService', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 새로운 사용자 프로필 생성
  Future<UserModel> createUserProfile({
    required String uid,
    required String email,
    required String name,
    required String introduce,
    String? profileUrl,
  }) async {
    final userModel = UserModel(
      uid: uid,
      email: email,
      name: name,
      introduce: introduce,
      profileUrl: profileUrl,
    );
    await _client.from('users').insert(userModel.toJson());
    return userModel;
  }
}
