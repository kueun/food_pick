import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart'; // PointerDeviceKind를 위해 추가
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_pic_app/config/app_config.dart';
import 'package:food_pic_app/config/app_theme.dart';
import 'package:food_pic_app/config/naver_map_config.dart';
import 'package:food_pic_app/config/supabase_config.dart';
import 'package:food_pic_app/config/app_router.dart';

/// 앱의 진입점 - Flutter 3.32.0 최신 버전
///
/// Material You (Material 3) 디자인 시스템을 완전히 적용하고
/// 최신 Flutter 기능들을 활용합니다.
Future<void> main() async {
  // Flutter 엔진과 위젯 바인딩을 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // 시스템 UI 설정 - Android 15 스타일 (Android에서만 적용)
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
      ),
    );
    // Edge-to-Edge 디스플레이 모드
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top],
    );
  }

  // 화면 방향 설정
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 환경변수 로드
  try {
    await dotenv.load(fileName: ".env");
    debugPrint('✅ .env 파일 로드 성공');
    if (!dotenv.isInitialized) {
      throw Exception('.env 파일이 로드되지 않았습니다. 앱을 종료합니다.');
    }
  } catch (e) {
    debugPrint('❌ .env 파일 로드 실패:');
    debugPrint(e.toString());
    throw Exception('.env 파일 로드에 실패하여 앱을 종료합니다.');
  }

  // Supabase 초기화 (별도 파일에서 관리)
  try {
    await SupabaseConfig.initialize();
  } catch (e) {
    debugPrint('❌ Supabase 초기화 실패: ');
    debugPrint(e.toString());
    throw Exception('Supabase 초기화에 실패하여 앱을 종료합니다.');
  }

  // 개발 중 테스트를 위해 기존 세션 로그아웃
  // await SupabaseConfig.signOutForTesting(); // 개발 중 테스트를 위해 기존 세션 로그아웃 (비활성화)

  // 네이버 맵 SDK 초기화 (별도 파일에서 관리)
  final isMapInitialized = await NaverMapConfig.initialize();
  if (!isMapInitialized) {
    debugPrint('⚠️ 네이버 맵 초기화 실패 - 앱은 계속 실행됩니다');
  }

  // 앱 실행
  runApp(ProviderScope(child: MyApp(isMapInitialized: isMapInitialized)));
}

/// 앱의 루트 위젯 - Material You 디자인 적용
///
/// Flutter 3.32.0의 최신 기능과 Material 3 디자인을 완전히 활용합니다.
class MyApp extends ConsumerWidget {
  final bool isMapInitialized;

  const MyApp({super.key, required this.isMapInitialized});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: AppConfig.appName,

      // GoRouter 설정
      routerConfig: AppRouter.router,

      // Material You (Material 3) 테마
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // 고해상도 디스플레이 지원
      themeAnimationDuration: const Duration(milliseconds: 200),
      themeAnimationCurve: Curves.easeInOut,

      // 디버그 배너 제거
      debugShowCheckedModeBanner: false,

      // 스크롤 동작 커스터마이징
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        platform: TargetPlatform.android,
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.stylus,
        },
      ),

      // 앱 복원 ID
      //restorationScopeId: 'food_pic_app',

      // 텍스트 스케일링 제한
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(
              MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}

// 메인 다트 파일..
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
