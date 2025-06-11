import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// 즐겨찾기 화면 위젯
///
/// 사용자가 즐겨찾기한 음식점 목록을 표시하는 화면입니다.
/// 현재는 개발 중인 상태로 기본 UI만 구현되어 있습니다.
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      // 앱바 설정
      appBar: AppBar(title: const Text('즐겨찾기'), centerTitle: true),
      // 화면 본문
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 즐겨찾기 아이콘
            Icon(
              Icons.favorite_border,
              size: 80,
              color: colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            const SizedBox(height: 24),
            // 안내 텍스트
            Text('즐겨찾기한 음식점이 없습니다', style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              '마음에 드는 음식점을 즐겨찾기해보세요!',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
