import 'package:flutter/material.dart';

/// 커스텀 타이틀 텍스트 위젯
///
/// 앱 전체에서 일관된 스타일의 타이틀 텍스트를 제공하는 위젯입니다.
/// 화면 제목, 섹션 제목 등에 사용됩니다.
class TitleText extends StatelessWidget {
  /// 표시할 텍스트
  final String text;

  /// 텍스트 크기 (선택사항)
  /// 기본값: 24
  final double fontSize;

  /// 텍스트 색상 (선택사항)
  /// 지정하지 않으면 검정색을 사용합니다.
  final Color? color;

  /// 텍스트 정렬 (선택사항)
  /// 기본값: 왼쪽 정렬
  final TextAlign textAlign;

  /// TitleText 생성자
  const TitleText({
    super.key,
    required this.text,
    this.fontSize = 24,
    this.color,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      ),
    );
  }
}

/// 커스텀 서브타이틀 텍스트 위젯
///
/// 앱 전체에서 일관된 스타일의 서브타이틀 텍스트를 제공하는 위젯입니다.
/// 설명 텍스트, 부제목 등에 사용됩니다.
class SubtitleText extends StatelessWidget {
  /// 표시할 텍스트
  final String text;

  /// 텍스트 크기 (선택사항)
  /// 기본값: 16
  final double fontSize;

  /// 텍스트 색상 (선택사항)
  /// 지정하지 않으면 회색을 사용합니다.
  final Color? color;

  /// 텍스트 정렬 (선택사항)
  /// 기본값: 왼쪽 정렬
  final TextAlign textAlign;

  /// 최대 줄 수 (선택사항)
  /// null인 경우 제한 없음
  final int? maxLines;

  /// SubtitleText 생성자
  const SubtitleText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? Colors.grey[600],
        height: 1.5,
      ),
    );
  }
}
