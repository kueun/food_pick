import 'package:flutter/material.dart';

/// 이미지 선택 옵션을 표시하는 바텀시트 위젯
class ImagePickerOption extends StatelessWidget {
  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;
  final VoidCallback? onTapDelete;

  const ImagePickerOption({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    // 팝업을 닫고 콜백을 실행하는 헬퍼 함수
    void popAndCall(VoidCallback callback) {
      Navigator.pop(context);
      callback();
    }

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('프로필 사진 변경', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ImageOptionButton(
                icon: Icons.camera_alt_outlined,
                label: '카메라',
                onTap: () => popAndCall(onTapCamera),
              ),
              _ImageOptionButton(
                icon: Icons.photo_library_outlined,
                label: '갤러리',
                onTap: () => popAndCall(onTapGallery),
              ),
              if (onTapDelete != null)
                _ImageOptionButton(
                  icon: Icons.delete_outline,
                  label: '삭제',
                  onTap: () => popAndCall(onTapDelete!),
                  color: Theme.of(context).colorScheme.error,
                ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// 이미지 선택 옵션의 각 버튼
class _ImageOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const _ImageOptionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = color ?? theme.colorScheme.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor.withOpacity(0.1),
              ),
              child: Icon(icon, size: 32, color: iconColor),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(color: iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
