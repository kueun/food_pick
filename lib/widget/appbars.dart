import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 커스텀 앱바 위젯
///
/// 앱 전체에서 일관된 스타일의 앱바를 제공하는 위젯입니다.
/// PreferredSizeWidget을 구현하여 Scaffold의 appBar로 사용할 수 있습니다.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// 앱바에 표시될 제목
  final String title;

  /// 뒤로가기 버튼 표시 여부
  /// true인 경우 자동으로 뒤로가기 버튼이 표시됩니다.
  final bool showBackButton;

  /// 앱바 우측에 표시될 액션 위젯들 (선택사항)
  final List<Widget>? actions;

  /// 앱바의 배경색 (선택사항)
  /// 지정하지 않으면 투명한 배경을 사용합니다.
  final Color? backgroundColor;

  /// 앱바의 그림자 높이 (선택사항)
  /// 기본값: 0 (그림자 없음)
  final double elevation;

  /// 제목 텍스트 색상 (선택사항)
  /// 지정하지 않으면 검정색을 사용합니다.
  final Color? titleColor;

  /// CustomAppBar 생성자
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.elevation = 0,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation,
      // 뒤로가기 버튼 자동 표시 설정
      automaticallyImplyLeading: showBackButton,
      // 뒤로가기 버튼 색상
      iconTheme: IconThemeData(color: titleColor ?? Colors.black),
      // 우측 액션 버튼들
      actions: actions,
    );
  }

  /// PreferredSizeWidget 인터페이스 구현
  /// 앱바의 기본 높이를 반환합니다.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// 검색 기능이 있는 커스텀 앱바 위젯
///
/// 검색 입력 필드가 포함된 앱바를 제공합니다.
class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// 검색 필드의 힌트 텍스트
  final String hintText;

  /// 검색어 변경 시 호출되는 콜백 함수
  final Function(String) onChanged;

  /// 검색 제출 시 호출되는 콜백 함수 (선택사항)
  final Function(String)? onSubmitted;

  /// 텍스트 편집 컨트롤러 (선택사항)
  final TextEditingController? controller;

  /// SearchAppBar 생성자
  const SearchAppBar({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.onSubmitted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool isLeading; // 백버튼 존재 여부
  Function? onTapBackButton; // 뒤로가기 버튼 액션 정의
  List<Widget>? actions; // 앱바 우측에 버튼들 필요할 때 정의

  CommonAppBar({
    super.key,

    required this.title,
    required this.isLeading,
    this.onTapBackButton,
    this.actions,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 48,
      automaticallyImplyLeading: isLeading,
      titleSpacing: isLeading ? 0 : 16,
      scrolledUnderElevation: 3,
      backgroundColor: Colors.white,
      leading:
          isLeading
              ? GestureDetector(
                child: Icon(Icons.arrow_back, color: Colors.black),
                onTap: () {
                  onTapBackButton != null
                      ? onTapBackButton!.call()
                      : Navigator.pop(context);
                },
              )
              : null,
      elevation: 1,
      actions: actions,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
