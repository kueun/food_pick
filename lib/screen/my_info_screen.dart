import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:food_pic_app/model/user.dart';
import 'package:food_pic_app/providers/auth_provider.dart';
import 'package:food_pic_app/widget/error_display.dart';

/// 내 정보 화면 위젯
///
/// 사용자의 프로필 정보를 표시하고 로그아웃 기능을 제공합니다.
/// `ConsumerWidget`을 사용하여 인증 상태를 구독하고,
/// `AsyncValue`를 통해 로딩, 에러, 데이터 상태를 명확하게 처리합니다.
class MyInfoScreen extends ConsumerWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // authProvider를 통해 현재 사용자 정보의 상태를 감시
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 정보'),
        actions: [
          // 로그아웃 버튼
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () async => _showLogoutDialog(context, ref),
          ),
        ],
      ),
      // authState의 상태에 따라 다른 UI를 표시
      body: authState.when(
        data: (user) {
          if (user == null) {
            // 사용자가 로그아웃했거나 정보가 없는 경우
            return const Center(child: Text('로그인 정보가 없습니다.'));
          }
          // 사용자 정보가 성공적으로 로드된 경우
          return _buildUserProfile(context, user);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (err, stack) => Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ErrorDisplay(error: err.toString()),
              ),
            ),
      ),
    );
  }

  /// 로그아웃 확인 다이얼로그를 표시하는 함수
  Future<void> _showLogoutDialog(BuildContext context, WidgetRef ref) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('로그아웃'),
            content: const Text('정말 로그아웃 하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('취소'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                child: const Text('로그아웃'),
              ),
            ],
          ),
    );

    if (shouldLogout ?? false) {
      await ref.read(authProvider.notifier).signOut();
      if (context.mounted) {
        // 스플래시 화면으로 보내서 라우팅 로직을 다시 태우도록 함
        context.go('/');
      }
    }
  }

  /// 사용자 프로필 UI를 빌드하는 위젯
  Widget _buildUserProfile(BuildContext context, UserModel user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 프로필 이미지
          CircleAvatar(
            radius: 60,
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            child:
                user.profileUrl != null
                    ? ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: user.profileUrl!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => const CircularProgressIndicator(),
                        errorWidget:
                            (context, url, error) => Icon(
                              Icons.person_outline,
                              size: 60,
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onSecondaryContainer,
                            ),
                      ),
                    )
                    : Icon(
                      Icons.person_outline,
                      size: 60,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
          ),
          const SizedBox(height: 24),

          // 사용자 정보 카드
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _InfoRow(
                    icon: Icons.badge_outlined,
                    label: '이름',
                    value: user.name,
                  ),
                  const Divider(),
                  _InfoRow(
                    icon: Icons.email_outlined,
                    label: '이메일',
                    value: user.email,
                  ),
                  const Divider(),
                  _InfoRow(
                    icon: Icons.notes_outlined,
                    label: '자기소개',
                    value: user.introduce ?? '자기소개가 없습니다.',
                    isMultiline: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 정보 행을 표시하는 private 위젯
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isMultiline;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        crossAxisAlignment:
            isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 22, color: theme.colorScheme.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Text(value, style: theme.textTheme.bodyLarge, softWrap: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
