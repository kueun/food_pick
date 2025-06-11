import 'dart:developer';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:food_pic_app/config/app_config.dart';

/// 네이버 맵 설정 및 초기화를 담당하는 클래스
///
/// 네이버 맵 SDK의 초기화와 관련된 모든 설정을 관리합니다.
class NaverMapConfig {
  // 네이버 클라우드 플랫폼에서 발급받은 Client ID
  static String get clientId => AppConfig.naverMapClientId;

  // Android 패키지명
  static const String androidPackageName = 'com.example.food_pic_app';

  // iOS Bundle ID
  static const String iosBundleId = 'com.example.foodPicApp';

  /// 네이버 맵 SDK 초기화
  ///
  /// 앱 시작 시 한 번만 호출되어야 합니다.
  /// 초기화 실패 시 상세한 디버깅 정보를 출력합니다.
  static Future<bool> initialize() async {
    // Client ID가 설정되지 않은 경우 초기화 시도하지 않음
    if (clientId.isEmpty) {
      log(
        '⚠️ 네이버 맵 Client ID가 설정되지 않았습니다. .env 파일을 확인해주세요.',
        name: 'NaverMapConfig',
      );
      return false;
    }

    try {
      log('=== 네이버 맵 SDK 초기화 시작 ===', name: 'NaverMapConfig');
      log('Client ID: $clientId', name: 'NaverMapConfig');
      log('현재 시간: ${DateTime.now()}', name: 'NaverMapConfig');
      log('================================', name: 'NaverMapConfig');

      await NaverMapSdk.instance.initialize(
        clientId: clientId,
        onAuthFailed: (ex) {
          _handleAuthFailure(ex);
        },
      );

      log('✅ 네이버 맵 SDK 초기화 성공', name: 'NaverMapConfig');
      return true;
    } catch (e, stackTrace) {
      log(
        '❌ 네이버 맵 SDK 초기화 실패',
        error: e,
        stackTrace: stackTrace,
        name: 'NaverMapConfig',
      );
      return false;
    }
  }

  /// 인증 실패 처리
  ///
  /// 네이버 맵 인증 실패 시 상세한 디버깅 정보를 출력합니다.
  static void _handleAuthFailure(NAuthFailedException ex) {
    log('=== 네이버 맵 인증 실패 ===', name: 'NaverMapConfig', error: ex);
    log('에러 코드: ${ex.code}', name: 'NaverMapConfig');
    log('에러 메시지: ${ex.message}', name: 'NaverMapConfig');
    log('발생 시간: ${DateTime.now()}', name: 'NaverMapConfig');
    log('---', name: 'NaverMapConfig');
    log('🔧 해결 방법:', name: 'NaverMapConfig');
    log('1. 네이버 클라우드 플랫폼(ncloud.com) 콘솔 확인', name: 'NaverMapConfig');
    log(
      '2. Application의 Mobile Dynamic Map 서비스 활성화 확인',
      name: 'NaverMapConfig',
    );
    log('3. 등록된 패키지명/Bundle ID 확인:', name: 'NaverMapConfig');
    log('   - Android: $androidPackageName', name: 'NaverMapConfig');
    log('   - iOS: $iosBundleId', name: 'NaverMapConfig');
    log('4. .env 파일의 NAVER_MAP_CLIENT_ID 값 확인', name: 'NaverMapConfig');
    log('========================', name: 'NaverMapConfig');
  }

  /// 네이버 맵 설정 정보 출력
  ///
  /// 디버깅을 위한 현재 설정 정보를 출력합니다.
  static void printConfiguration() {
    log('=== 네이버 맵 현재 설정 ===', name: 'NaverMapConfig');
    log('Client ID: $clientId', name: 'NaverMapConfig');
    log('Android Package: $androidPackageName', name: 'NaverMapConfig');
    log('iOS Bundle ID: $iosBundleId', name: 'NaverMapConfig');
    log('=========================', name: 'NaverMapConfig');
  }
}
