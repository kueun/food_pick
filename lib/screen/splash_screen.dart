import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_pic_app/model/user.dart';
import 'package:food_pic_app/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

/// 스플래시 화면 위젯
///
/// 앱이 시작될 때 가장 먼저 표시되는 화면입니다.
/// Riverpod의 `ref.listen`을 사용하여 인증 상태를 감지하고
/// 적절한 화면으로 자동 이동합니다.
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    authState.when(
      data: (user) {
        Future.delayed(const Duration(seconds: 2), () {
          if (!context.mounted) return;
          if (user != null) {
            context.go('/main');
          } else {
            context.go('/login');
          }
        });
      },
      loading: () {
        // 로딩 중이라면 아무 것도 하지 않음 (Indicator 유지)
      },
      error: (e, st) {
        // 에러가 발생했을 경우 로그인으로 보냄
        Future.delayed(const Duration(seconds: 2), () {
          if (!context.mounted) return;
          context.go('/login');
        });
      },
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.fastfood_outlined,
                size: 100,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(height: 24),
              Text(
                'Food Pick',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 48),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
