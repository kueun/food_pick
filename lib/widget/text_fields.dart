import 'package:flutter/material.dart';

/// 커스텀 텍스트 필드 위젯
///
/// 앱 전체에서 일관된 스타일의 텍스트 필드를 제공하는 위젯입니다.
/// 라벨, 힌트, 비밀번호 모드, 유효성 검사 등의 기능을 지원합니다.
class CustomTextField extends StatelessWidget {
  /// 텍스트 필드의 라벨
  final String label;

  /// 텍스트 필드의 힌트 텍스트
  final String hint;

  /// 텍스트 편집 컨트롤러
  final TextEditingController controller;

  /// 비밀번호 입력 모드 여부
  final bool isPassword;

  /// 유효성 검사 함수 (선택사항)
  final String? Function(String?)? validator;

  /// 키보드 타입 (선택사항)
  final TextInputType? keyboardType;

  /// 텍스트 대문자 설정 (선택사항)
  final TextCapitalization textCapitalization;

  /// 키보드 액션 (선택사항)
  final TextInputAction? textInputAction;

  /// 최대 줄 수 (선택사항)
  final int? maxLines;

  /// CustomTextField 생성자
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 라벨 텍스트
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        // 텍스트 필드
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          maxLines: isPassword ? 1 : maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
