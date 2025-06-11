import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_pic_app/providers/auth_provider.dart';
import 'package:food_pic_app/widget/error_display.dart';
import 'package:food_pic_app/widget/image_picker_option.dart';

/// 회원가입 화면 위젯 (Hooks 및 Riverpod 최적화)
/// 사용자가 새 계정을 생성할 수 있는 화면을 제공합니다.
/// 프로필 이미지, 닉네임, 이메일, 비밀번호, 자기소개 입력을 받습니다.
class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Hooks
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordReController = useTextEditingController();
    final introduceController = useTextEditingController();
    final profileImg = useState<File?>(null);
    final obscurePassword = useState(true);
    final obscurePasswordRe = useState(true);
    final isSuccess = useState(false);

    // Provider state
    final authState = ref.watch(authProvider);

    // Listener for navigation and success/error messages
    ref.listen<AsyncValue>(authProvider, (_, state) {
      if (state.isLoading) return;
      if (!state.hasError && state.hasValue) {
        isSuccess.value = true;
        Future.delayed(const Duration(seconds: 2), () {
          if (context.mounted) context.go('/main');
        });
      }
    });

    // Methods
    Future<void> handleRegister() async {
      if (formKey.currentState?.validate() ?? false) {
        await ref
            .read(authProvider.notifier)
            .signUp(
              email: emailController.text.trim(),
              password: passwordController.text,
              name: nameController.text.trim(),
              introduce: introduceController.text.trim(),
              profileImage: profileImg.value,
            );
      }
    }

    Future<void> pickImage(ImageSource source) async {
      final image = await ImagePicker().pickImage(
        source: source,
        imageQuality: 70,
        maxWidth: 512,
      );
      if (image != null) {
        profileImg.value = File(image.path);
      }
    }

    void showImagePicker() {
      showModalBottomSheet(
        context: context,
        builder:
            (_) => ImagePickerOption(
              onTapCamera: () => pickImage(ImageSource.camera),
              onTapGallery: () => pickImage(ImageSource.gallery),
              onTapDelete:
                  profileImg.value != null
                      ? () => profileImg.value = null
                      : null,
            ),
      );
    }

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // 상단 앱바
      appBar: AppBar(title: const Text('회원가입'), centerTitle: true),

      body: SafeArea(
        child: SingleChildScrollView(
          // 스크롤 가능한 화면
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 프로필 이미지 선택 영역
                Center(
                  child: GestureDetector(
                    onTap: showImagePicker,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      backgroundImage:
                          profileImg.value != null
                              ? FileImage(profileImg.value!)
                              : null,
                      child:
                          profileImg.value == null
                              ? Icon(
                                Icons.add_a_photo_outlined,
                                size: 40,
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onSecondaryContainer,
                              )
                              : null,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // 프로필 사진 안내 텍스트
                Text(
                  '프로필 사진을 선택해주세요',
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall,
                ),
                const SizedBox(height: 32),

                // 닉네임 입력 필드
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: const InputDecoration(
                    labelText: '닉네임',
                    hintText: '닉네임을 입력해주세요 (한글, 영어 모두 가능)',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  // 닉네임 검증 로직
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '닉네임을 입력해주세요';
                    }
                    final trimmedValue = value.trim();
                    if (trimmedValue.length < 2) {
                      return '닉네임은 2자 이상이어야 합니다';
                    }
                    if (trimmedValue.length > 20) {
                      return '닉네임은 20자 이하여야 합니다';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // 이메일 입력 필드
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress, // 이메일 키보드
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: '이메일',
                    hintText: 'example@email.com',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  // 이메일 검증 로직
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '이메일을 입력해주세요';
                    }
                    // 이메일 형식 검증 정규식
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value.trim())) {
                      return '올바른 이메일 형식을 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // 비밀번호 입력 필드
                TextFormField(
                  controller: passwordController,
                  obscureText: obscurePassword.value,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    hintText: '비밀번호를 입력해주세요 (6자 이상)',
                    prefixIcon: const Icon(Icons.lock_outline),
                    // 비밀번호 표시/숨김 토글 버튼
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        obscurePassword.value = !obscurePassword.value;
                      },
                    ),
                  ),
                  // 비밀번호 검증 로직
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력해주세요';
                    }
                    if (value.length < 6) {
                      return '비밀번호는 6자 이상이어야 합니다';
                    }
                    if (value.length > 50) {
                      return '비밀번호는 50자 이하여야 합니다';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // 비밀번호 확인 입력 필드
                TextFormField(
                  controller: passwordReController,
                  obscureText: obscurePasswordRe.value,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: '비밀번호 확인',
                    hintText: '비밀번호를 다시 입력해주세요',
                    prefixIcon: const Icon(Icons.lock_outline),
                    // 비밀번호 표시/숨김 토글 버튼
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePasswordRe.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        obscurePasswordRe.value = !obscurePasswordRe.value;
                      },
                    ),
                  ),
                  // 비밀번호 확인 검증 로직
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 다시 입력해주세요';
                    }
                    if (value != passwordController.text) {
                      return '비밀번호가 일치하지 않습니다';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // 자기소개 입력 필드
                TextFormField(
                  controller: introduceController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  maxLines: 4,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: const InputDecoration(
                    labelText: '자기소개',
                    hintText: '자기소개를 입력해주세요 (한글, 영어, 이모지 등 모든 문자 가능)',
                    prefixIcon: Icon(Icons.edit_outlined),
                    alignLabelWithHint: true,
                  ),
                  // 자기소개 검증 로직 - 모든 문자 허용
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '자기소개를 입력해주세요';
                    }
                    final trimmedValue = value.trim();
                    if (trimmedValue.length < 10) {
                      return '자기소개는 10자 이상 입력해주세요';
                    }
                    if (trimmedValue.length > 500) {
                      return '자기소개는 500자 이하로 입력해주세요';
                    }
                    // 자기소개는 모든 문자 허용 (특별한 제한 없음)
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // 회원가입 버튼
                FilledButton(
                  onPressed: authState.isLoading ? null : handleRegister,
                  child:
                      authState.isLoading
                          ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(strokeWidth: 3),
                          )
                          : const Text(
                            '회원가입',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                ),
                const SizedBox(height: 16),

                // 로그인 화면으로 이동하는 버튼
                TextButton(
                  onPressed: () => Navigator.pop(context), // 이전 화면(로그인)으로 돌아가기
                  child: const Text(
                    '이미 계정이 있으신가요? 로그인',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),

                // 회원가입 성공 메시지
                if (isSuccess.value) ...[
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.green.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '회원가입 성공! ${nameController.text}님 환영합니다.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                // 에러 메시지
                if (authState is AsyncError && authState.error != null) ...[
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: ErrorDisplay(error: authState.error.toString()),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
