// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationPermissionHash() =>
    r'fe68cb3a2c1ae759a9e4a70350452d34a3cac273';

/// 위치 권한 상태를 제공하는 Provider
///
/// 현재 위치 권한 상태를 확인하고, 권한이 없을 경우 요청합니다.
///
/// Copied from [locationPermission].
@ProviderFor(locationPermission)
final locationPermissionProvider =
    AutoDisposeFutureProvider<LocationPermissionStatus>.internal(
      locationPermission,
      name: r'locationPermissionProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$locationPermissionHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationPermissionRef =
    AutoDisposeFutureProviderRef<LocationPermissionStatus>;
String _$currentLocationHash() => r'b87791e134377f0f554008cb914431696db7693f';

/// 현재 사용자 위치를 제공하는 Provider
///
/// 위치 권한이 허용된 경우, 사용자의 현재 위치를 `Position` 객체로 반환합니다.
/// 권한이 없거나 위치를 가져오는 데 실패하면 예외를 발생시킵니다.
///
/// Copied from [currentLocation].
@ProviderFor(currentLocation)
final currentLocationProvider = AutoDisposeFutureProvider<Position>.internal(
  currentLocation,
  name: r'currentLocationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentLocationRef = AutoDisposeFutureProviderRef<Position>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
