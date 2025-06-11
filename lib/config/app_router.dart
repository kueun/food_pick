import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_pic_app/screen/splash_screen.dart';
import 'package:food_pic_app/screen/login_screen.dart';
import 'package:food_pic_app/screen/register_screen.dart';
import 'package:food_pic_app/screen/main_screen.dart';
import 'package:food_pic_app/widget/error_page.dart';

/// 앱의 라우팅 설정을 관리하는 클래스
///
/// GoRouter를 사용하여 선언적 라우팅을 구현합니다.
class AppRouter {
  /// GoRouter 인스턴스
  static final GoRouter router = GoRouter(
    // 초기 경로
    initialLocation: '/',

    // 디버그 로깅
    debugLogDiagnostics: true,

    // 라우트 정의
    routes: [
      // 스플래시 화면
      GoRoute(
        path: '/',
        name: 'splash',
        pageBuilder:
            (context, state) => _buildPageWithFadeTransition(
              context: context,
              state: state,
              child: const SplashScreen(),
            ),
      ),

      // 로그인 화면
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder:
            (context, state) => _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const LoginScreen(),
            ),
      ),

      // 회원가입 화면
      GoRoute(
        path: '/register',
        name: 'register',
        pageBuilder:
            (context, state) => _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const RegisterScreen(),
            ),
      ),

      // 메인 화면
      GoRoute(
        path: '/main',
        name: 'main',
        pageBuilder:
            (context, state) => _buildPageWithFadeTransition(
              context: context,
              state: state,
              child: const MainScreen(),
            ),
      ),
    ],

    // 에러 페이지 빌더
    errorPageBuilder:
        (context, state) => MaterialPage(
          key: state.pageKey,
          child: ErrorPage(error: state.error?.toString() ?? '알 수 없는 오류'),
        ),

    // 리다이렉트 로직 (인증 상태에 따른 라우팅 등)
    redirect: (context, state) {
      // 여기에 인증 상태 확인 로직을 추가할 수 있습니다
      // 예시:
      // final isAuthenticated = ref.read(isLoggedInProvider);
      // final isLoggingIn = state.subloc == '/login';
      //
      // if (!isAuthenticated && !isLoggingIn) {
      //   return '/login';
      // }

      return null; // null을 반환하면 요청된 경로로 이동
    },
  );

  /// 네비게이션 헬퍼 메서드들

  /// 로그인 화면으로 이동
  static void goToLogin(BuildContext context) {
    context.goNamed('login');
  }

  /// 회원가입 화면으로 이동
  static void goToRegister(BuildContext context) {
    context.goNamed('register');
  }

  /// 메인 화면으로 이동 (새로운 내용으로 교체)
  static void goToMain(BuildContext context) {
    context.goNamed('main');
  }

  /// 뒤로가기
  static void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.goNamed('main');
    }
  }

  // 공통 트랜지션 빌더

  /// Fade 트랜지션 페이지 빌더
  static CustomTransitionPage<T> _buildPageWithFadeTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
    );
  }

  /// Slide 트랜지션 페이지 빌더
  static CustomTransitionPage<T> _buildPageWithSlideTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;
        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
