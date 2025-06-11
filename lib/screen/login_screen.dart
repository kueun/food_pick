import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:food_pic_app/providers/auth_provider.dart';
import 'package:food_pic_app/widget/app_logo.dart';
import 'package:food_pic_app/widget/error_display.dart';
import 'package:food_pic_app/model/user.dart';

/// 로그인 화면 위젯 (Hooks 및 Riverpod 최적화)
///
/// Material 3 디자인을 적용하고, `HookConsumerWidget`을 사용하여
/// 상태 관리 및 위젯 생명주기를 간결하게 처리합니다.
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscurePassword = useState(true);

    // Riverpod authProvider의 상태를 감시
    final authState = ref.watch(authProvider);

    // ref.listen을 사용하여 인증 상태 변경 시 네비게이션 처리
    ref.listen<AsyncValue<UserModel?>>(authProvider, (_, state) {
      if (state is AsyncData && state.value != null) {
        // 로그인 성공 시 main 화면으로 이동
        context.go('/main');
      } else if (state is AsyncError) {
        // 로그인 실패 시 에러 메시지 출력 (이미 화면에 출력됨)
        print('로그인 오류: ${state.error}');
      }
    });

    // 로그인 처리 함수
    Future<void> handleLogin() async {
      if (formKey.currentState?.validate() ?? false) {
        // 로그인 시도
        await ref
            .read(authProvider.notifier)
            .signIn(
              email: emailController.text.trim(),
              password: passwordController.text,
            );
      }
    }

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppLogo(),
                  const SizedBox(height: 8),
                  Text(
                    '로그인하여 맛있는 음식을 찾아보세요',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 48),
                  // 에러 메시지 표시 위젯
                  if (authState is AsyncError && authState.error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: ErrorDisplay(error: authState.error.toString()),
                    ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: '이메일',
                      hintText: 'example@email.com',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이메일을 입력해주세요';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return '올바른 이메일 형식을 입력해주세요';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: obscurePassword.value,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => handleLogin(),
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      prefixIcon: const Icon(Icons.lock_outlined),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed:
                            () =>
                                obscurePassword.value = !obscurePassword.value,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력해주세요';
                      }
                      if (value.length < 6) {
                        return '비밀번호는 6자 이상이어야 합니다';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: authState.isLoading ? null : handleLogin,
                    child:
                        authState.isLoading
                            ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(strokeWidth: 3),
                            )
                            : const Text('로그인'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => context.go('/register'),
                    child: Text(
                      '계정이 없으신가요? 회원가입',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
