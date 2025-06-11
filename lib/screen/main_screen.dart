import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_pic_app/screen/favorite_screen.dart';
import 'package:food_pic_app/screen/home_screen.dart';
import 'package:food_pic_app/screen/my_info_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:food_pic_app/services/supabase_service.dart';

/// 메인 화면 위젯 (Hooks 최적화)
///
/// Material 3의 NavigationBar를 사용하여 홈, 즐겨찾기, 내 정보 화면을 전환합니다.
/// `HookWidget`과 `useState`를 사용하여 탭 상태를 간결하게 관리합니다.
class MainScreen extends HookWidget {
  const MainScreen({super.key});

  // 각 탭에 표시될 화면 위젯 목록
  static const List<Widget> _screens = [
    HomeScreen(), // 0: 홈 화면 (지도)
    FavoriteScreen(), // 1: 즐겨찾기 화면
    MyInfoScreen(), // 2: 내 정보 화면
  ];

  @override
  Widget build(BuildContext context) {
    // useState를 사용하여 현재 선택된 탭의 인덱스를 관리
    final selectedIndex = useState(0);

    return Scaffold(
      // IndexedStack을 사용하여 화면 전환 시 상태 유지
      body: IndexedStack(index: selectedIndex.value, children: _screens),
      // Material 3 NavigationBar
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex.value,
        onDestinationSelected: (index) {
          selectedIndex.value = index;
        },
        // 네비게이션 목적지 정의
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: '지도',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: '즐겨찾기',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: '내 정보',
          ),
        ],
      ),
    );
  }
}
