import 'package:flutter/material.dart';

/// 에러 메시지를 표시하는 공통 위젯
///
/// 사용자의 규칙에 따라 `SelectableText.rich`를 사용하여
/// 눈에 띄는 스타일로 에러를 표시합니다.
class ErrorDisplay extends StatelessWidget {
  final String error;

  const ErrorDisplay({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.errorContainer, width: 1),
      ),
      child: SelectableText.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Icons.error_outline,
                color: colorScheme.error,
                size: 18,
              ),
            ),
            const WidgetSpan(child: SizedBox(width: 8)),
            TextSpan(
              text: error,
              style: TextStyle(
                color: colorScheme.error,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
