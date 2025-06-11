import 'package:flutter/material.dart';

/// 커스텀 버튼 위젯
///
/// 앱 전체에서 일관된 스타일의 버튼을 제공하는 위젯입니다.
/// 로딩 상태 표시, 비활성화 등의 기능을 지원합니다.
class CustomButton extends StatelessWidget {
  /// 버튼에 표시될 텍스트
  final String text;

  /// 버튼 클릭 시 실행될 콜백 함수
  /// null인 경우 버튼이 비활성화됩니다.
  final VoidCallback? onPressed;

  /// 로딩 상태 여부
  /// true인 경우 로딩 인디케이터를 표시합니다.
  final bool isLoading;

  /// 버튼의 배경색 (선택사항)
  /// 지정하지 않으면 테마의 기본 색상을 사용합니다.
  final Color? backgroundColor;

  /// 버튼의 텍스트 색상 (선택사항)
  /// 지정하지 않으면 흰색을 사용합니다.
  final Color? textColor;

  /// CustomButton 생성자
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: isLoading ? 0 : 2,
        ),
        child:
            isLoading
                ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                : Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
      ),
    );
  }
}
