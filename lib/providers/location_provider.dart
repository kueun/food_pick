import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

/// 위치 서비스 및 권한 상태를 나타내는 열거형
enum LocationPermissionStatus {
  serviceDisabled,
  permissionDenied,
  permissionDeniedForever,
  permissionGranted,
}

/// 위치 권한 상태를 제공하는 Provider
///
/// 현재 위치 권한 상태를 확인하고, 권한이 없을 경우 요청합니다.
@riverpod
Future<LocationPermissionStatus> locationPermission(
  LocationPermissionRef ref,
) async {
  // 위치 서비스 활성화 여부 확인
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return LocationPermissionStatus.serviceDisabled;
  }

  // 현재 위치 권한 확인
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    // 권한이 거부된 경우, 새로 요청
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return LocationPermissionStatus.permissionDenied;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // 권한이 영구적으로 거부된 경우
    return LocationPermissionStatus.permissionDeniedForever;
  }

  // 권한이 허용된 경우
  return LocationPermissionStatus.permissionGranted;
}

/// 현재 사용자 위치를 제공하는 Provider
///
/// 위치 권한이 허용된 경우, 사용자의 현재 위치를 `Position` 객체로 반환합니다.
/// 권한이 없거나 위치를 가져오는 데 실패하면 예외를 발생시킵니다.
@riverpod
Future<Position> currentLocation(CurrentLocationRef ref) async {
  // 위치 권한 상태를 감시하고, 권한이 부여되었는지 확인
  final permission = await ref.watch(locationPermissionProvider.future);

  if (permission != LocationPermissionStatus.permissionGranted) {
    // 권한이 없는 경우, 에러 메시지와 함께 예외 발생
    throw Exception('위치 권한이 허용되지 않았습니다.');
  }

  // 현재 위치 가져오기
  try {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 10),
    );
  } catch (e) {
    // 위치 정보를 가져오는 데 실패한 경우, 예외를 다시 발생
    throw Exception('현재 위치를 가져올 수 없습니다: $e');
  }
}
