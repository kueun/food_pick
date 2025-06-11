import 'package:flutter_dotenv/flutter_dotenv.dart';

/// 앱 전체에서 사용되는 설정값들을 관리하는 클래스
///
/// 환경변수(.env 파일)에서 읽어온 값들을 정적 변수로 제공하여
/// 앱 전체에서 쉽게 접근할 수 있도록 합니다.
///
/// 사용 예시:
/// ```dart
/// final url = AppConfig.supabaseUrl;
/// ```
class AppConfig {
  /// 앱의 이름
  /// 앱바, 타이틀 등에서 사용됩니다.
  static const String appName = 'Food Pick';

  /// Supabase 프로젝트의 URL
  /// ⚠️ 경고: 프로덕션에서는 반드시 .env 파일을 사용하세요!
  /// 이 하드코딩된 값은 개발 목적으로만 사용됩니다.
  static String get supabaseUrl =>
      dotenv.env['SUPABASE_URL'] ?? 'https://wukcxgdrepztncgtrhfb.supabase.co';

  /// Supabase 프로젝트의 익명 키 (anon key)
  /// ⚠️ 경고: 프로덕션에서는 반드시 .env 파일을 사용하세요!
  /// 이 하드코딩된 값은 개발 목적으로만 사용됩니다.
  static String get supabaseAnonKey =>
      dotenv.env['SUPABASE_ANON_KEY'] ??
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind1a2N4Z2RyZXB6dG5jZ3RyaGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc4ODA2NzEsImV4cCI6MjA2MzQ1NjY3MX0.91LPm5M7KXXeIb57tHDACm6zEYMjktgWQAK-MLcQUpI';

  /// Naver Maps API의 클라이언트 ID
  /// 환경변수에서 읽어오며, 없을 경우 빈 문자열을 반환합니다.
  static String get naverMapClientId => dotenv.env['NAVER_MAP_CLIENT_ID'] ?? '';

  static const String appVersion = '1.0.0';
}
