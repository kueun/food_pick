import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:food_pic_app/providers/location_provider.dart';
import 'package:food_pic_app/widget/error_display.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 홈 화면 - 네이버 지도를 표시하고 사용자의 현재 위치를 나타냅니다.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  NaverMapController? _mapController;
  final Completer<void> _mapReadyCompleter = Completer();

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  // 현재 위치로 카메라를 이동하고 마커를 추가하는 함수
  Future<void> _moveToCurrentLocation(NLatLng position) async {
    await _mapReadyCompleter.future;
    if (_mapController == null) return;

    final cameraUpdate = NCameraUpdate.withParams(target: position, zoom: 16);
    _mapController!.updateCamera(cameraUpdate);

    final marker = NMarker(
      id: 'current_location',
      position: position,
      caption: const NOverlayCaption(text: '현재 위치'),
    );
    _mapController!.addOverlay(marker);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // 현재 위치 상태를 감시
    final locationState = ref.watch(currentLocationProvider);

    return Scaffold(
      body: locationState.when(
        data: (position) {
          final currentLatLng = NLatLng(position.latitude, position.longitude);
          _moveToCurrentLocation(currentLatLng);

          return NaverMap(
            options: const NaverMapViewOptions(
              initialCameraPosition: NCameraPosition(
                target: NLatLng(37.5666805, 126.9784147), // 기본 위치: 서울시청
                zoom: 15,
              ),
              mapType: NMapType.basic,
              activeLayerGroups: [NLayerGroup.building, NLayerGroup.transit],
              locationButtonEnable: true,
              consumeSymbolTapEvents: false,
            ),
            onMapReady: (controller) {
              _mapController = controller;
              if (!_mapReadyCompleter.isCompleted) {
                _mapReadyCompleter.complete();
              }
              log('NaverMap is ready.', name: 'HomeScreen');
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          log(
            'Location Error',
            name: 'HomeScreen',
            error: error,
            stackTrace: stackTrace,
          );
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ErrorDisplay(error: error.toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.invalidate(currentLocationProvider),
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
