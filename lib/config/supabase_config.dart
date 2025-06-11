import 'dart:async'; // StreamSubscription을 위해 추가
import 'dart:developer'; // log 함수를 위해 추가
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:food_pic_app/config/app_config.dart';

/// Supabase 설정 및 초기화를 담당하는 클래스
///
/// Supabase 클라이언트의 초기화와 관련된 모든 설정을 관리합니다.
class SupabaseConfig {
  // Supabase 클라이언트 싱글톤 인스턴스
  static SupabaseClient get client => Supabase.instance.client;

  // 현재 인증된 사용자
  static User? get currentUser => client.auth.currentUser;

  // 현재 세션
  static Session? get currentSession => client.auth.currentSession;

  /// Supabase 초기화
  ///
  /// 앱 시작 시 한 번만 호출되어야 합니다.
  /// 환경변수에서 URL과 Anon Key를 읽어 초기화합니다.
  static Future<void> initialize() async {
    try {
      log('=== Supabase 초기화 시작 ===', name: 'SupabaseConfig');
      log('URL: ${AppConfig.supabaseUrl}', name: 'SupabaseConfig');
      log('현재 시간: ${DateTime.now()}', name: 'SupabaseConfig');
      log('===========================', name: 'SupabaseConfig');

      await Supabase.initialize(
        url: AppConfig.supabaseUrl,
        anonKey: AppConfig.supabaseAnonKey,
      );

      log('✅ Supabase 초기화 성공', name: 'SupabaseConfig');

      // 초기화 후 상태 확인
      _printCurrentStatus();
    } catch (e, stackTrace) {
      log(
        '❌ Supabase 초기화 실패',
        error: e,
        stackTrace: stackTrace,
        name: 'SupabaseConfig',
      );
      rethrow;
    }
  }

  /// 개발 중 테스트를 위한 로그아웃
  ///
  /// 기존 세션을 정리하여 깨끗한 상태로 시작합니다.
  static Future<void> signOutForTesting() async {
    try {
      await client.auth.signOut();
      log('🔄 테스트를 위한 로그아웃 완료', name: 'SupabaseConfig');
    } catch (e, stackTrace) {
      log(
        '⚠️ 로그아웃 중 오류 발생 (무시됨)',
        error: e,
        stackTrace: stackTrace,
        name: 'SupabaseConfig',
      );
    }
  }

  /// 현재 인증 상태 확인
  ///
  /// 사용자가 로그인되어 있는지 확인합니다.
  static bool get isAuthenticated => currentUser != null;

  /// 현재 Supabase 상태 출력
  ///
  /// 디버깅을 위한 현재 상태 정보를 출력합니다.
  static void _printCurrentStatus() {
    log('=== Supabase 현재 상태 ===', name: 'SupabaseConfig');
    log('인증 상태: ${isAuthenticated ? "로그인됨" : "로그아웃됨"}', name: 'SupabaseConfig');
    log('사용자 ID: ${currentUser?.id ?? "없음"}', name: 'SupabaseConfig');
    log('사용자 이메일: ${currentUser?.email ?? "없음"}', name: 'SupabaseConfig');
    log(
      '세션 유효: ${currentSession != null ? "예" : "아니오"}',
      name: 'SupabaseConfig',
    );
    log('========================', name: 'SupabaseConfig');
  }

  /// 인증 상태 변경 리스너 설정
  ///
  /// 로그인/로그아웃 등 인증 상태 변경을 감지합니다.
  static StreamSubscription<AuthState> onAuthStateChange(
    void Function(AuthState) callback,
  ) {
    return client.auth.onAuthStateChange.listen(callback);
  }

  /// 사용자 메타데이터 업데이트
  ///
  /// 사용자의 추가 정보를 업데이트합니다.
  static Future<void> updateUserMetadata(Map<String, dynamic> metadata) async {
    try {
      await client.auth.updateUser(UserAttributes(data: metadata));
      log('✅ 사용자 메타데이터 업데이트 성공', name: 'SupabaseConfig');
    } catch (e, stackTrace) {
      log(
        '❌ 사용자 메타데이터 업데이트 실패',
        error: e,
        stackTrace: stackTrace,
        name: 'SupabaseConfig',
      );
      rethrow;
    }
  }

  /// 이메일로 로그인
  ///
  /// 이메일과 비밀번호를 사용하여 로그인합니다.
  static Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      log('✅ 이메일 로그인 성공: ${response.user?.email}', name: 'SupabaseConfig');
      return response;
    } catch (e, stackTrace) {
      log(
        '❌ 이메일 로그인 실패',
        error: e,
        stackTrace: stackTrace,
        name: 'SupabaseConfig',
      );
      rethrow;
    }
  }

  /// 이메일로 회원가입
  ///
  /// 새로운 사용자를 생성합니다.
  static Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
        data: metadata,
      );
      log('✅ 이메일 회원가입 성공: ${response.user?.email}', name: 'SupabaseConfig');
      return response;
    } catch (e, stackTrace) {
      log(
        '❌ 이메일 회원가입 실패',
        error: e,
        stackTrace: stackTrace,
        name: 'SupabaseConfig',
      );
      rethrow;
    }
  }

  /// 로그아웃
  ///
  /// 현재 사용자를 로그아웃합니다.
  static Future<void> signOut() async {
    try {
      await client.auth.signOut();
      log('✅ 로그아웃 성공', name: 'SupabaseConfig');
    } catch (e, stackTrace) {
      log(
        '❌ 로그아웃 실패',
        error: e,
        stackTrace: stackTrace,
        name: 'SupabaseConfig',
      );
      rethrow;
    }
  }

  /// 비밀번호 재설정 이메일 전송
  ///
  /// 비밀번호를 재설정할 수 있는 링크를 이메일로 전송합니다.
  static Future<void> resetPassword(String email) async {
    try {
      await client.auth.resetPasswordForEmail(email);
      log('✅ 비밀번호 재설정 이메일 전송 성공: $email', name: 'SupabaseConfig');
    } catch (e, stackTrace) {
      log(
        '❌ 비밀번호 재설정 이메일 전송 실패',
        error: e,
        stackTrace: stackTrace,
        name: 'SupabaseConfig',
      );
      rethrow;
    }
  }

  /// 세션 새로고침
  ///
  /// 만료된 세션을 새로고침합니다.
  static Future<AuthResponse> refreshSession() async {
    try {
      final response = await client.auth.refreshSession();
      log('✅ 세션 새로고침 성공', name: 'SupabaseConfig');
      return response;
    } catch (e, stackTrace) {
      log(
        '❌ 세션 새로고침 실패',
        error: e,
        stackTrace: stackTrace,
        name: 'SupabaseConfig',
      );
      rethrow;
    }
  }

  /// 사용자 삭제
  ///
  /// 현재 로그인된 사용자 계정을 삭제합니다.
  static Future<void> deleteUser() async {
    try {
      // 사용자 ID 가져오기
      final userId = currentUser?.id;
      if (userId == null) {
        throw Exception('로그인된 사용자가 없습니다');
      }

      // 관리자 권한으로 사용자 삭제 (서버 사이드에서 처리해야 함)
      // 클라이언트에서는 soft delete만 가능
      await updateUserMetadata({
        'deleted_at': DateTime.now().toIso8601String(),
      });

      // 로그아웃
      await signOut();

      log('✅ 사용자 삭제(soft delete) 성공', name: 'SupabaseConfig');
    } catch (e, stackTrace) {
      log(
        '❌ 사용자 삭제 실패',
        error: e,
        stackTrace: stackTrace,
        name: 'SupabaseConfig',
      );
      rethrow;
    }
  }
}

/// Supabase 테이블 이름 상수
///
/// 데이터베이스 테이블 이름을 중앙에서 관리합니다.
class SupabaseTables {
  static const String user = 'user';
  static const String restaurant = 'restaurant';
  static const String review = 'review';
  static const String favorite = 'favorite';
  static const String category = 'category';
}

/// Supabase 스토리지 버킷 이름 상수
///
/// 스토리지 버킷 이름을 중앙에서 관리합니다.
class SupabaseBuckets {
  static const String profileImages = 'profile-images';
  static const String restaurantImages = 'restaurant-images';
  static const String reviewImages = 'review-images';
}
