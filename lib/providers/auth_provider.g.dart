// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supabaseClientHash() => r'3632ee8e6d6421a4c6eceb5f4a50e3ff8d72e6e8';

/// Supabase 클라이언트를 제공하는 Provider
///
/// 앱 전체에서 Supabase 클라이언트에 접근할 수 있도록 합니다.
///
/// Copied from [supabaseClient].
@ProviderFor(supabaseClient)
final supabaseClientProvider = AutoDisposeProvider<SupabaseClient>.internal(
  supabaseClient,
  name: r'supabaseClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$supabaseClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SupabaseClientRef = AutoDisposeProviderRef<SupabaseClient>;
String _$supabaseUserHash() => r'499ccdee8c9cdd9bb7bb4f3251d28c2a2846ca26';

/// Supabase의 현재 사용자를 제공하는 Provider (Supabase User 객체)
///
/// Supabase Auth의 현재 사용자 정보를 반환합니다.
/// 로그인하지 않은 경우 null을 반환합니다.
///
/// Copied from [supabaseUser].
@ProviderFor(supabaseUser)
final supabaseUserProvider = AutoDisposeProvider<User?>.internal(
  supabaseUser,
  name: r'supabaseUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$supabaseUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SupabaseUserRef = AutoDisposeProviderRef<User?>;
String _$authStateChangesHash() => r'0c6d2dd36892936aaef5d1a9253d8052b3c5f8be';

/// 인증 상태 변경 스트림을 제공하는 Provider
///
/// 사용자의 로그인/로그아웃 상태 변화를 실시간으로 감지합니다.
/// 이를 통해 UI가 자동으로 인증 상태에 따라 업데이트됩니다.
///
/// Copied from [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider = AutoDisposeStreamProvider<AuthState>.internal(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateChangesRef = AutoDisposeStreamProviderRef<AuthState>;
String _$isLoggedInHash() => r'bfd46a1847cb33b8f7750d841154d29b83ecdb51';

/// 현재 로그인 상태(로그인 여부)를 제공하는 Provider
///
/// 사용자가 로그인되어 있으면 true, 아니면 false를 반환합니다.
///
/// 사용 예시:
/// ```dart
/// final isLoggedIn = ref.watch(isLoggedInProvider);
/// ```
///
/// Copied from [isLoggedIn].
@ProviderFor(isLoggedIn)
final isLoggedInProvider = AutoDisposeProvider<bool>.internal(
  isLoggedIn,
  name: r'isLoggedInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isLoggedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsLoggedInRef = AutoDisposeProviderRef<bool>;
String _$authHash() => r'4862ba0a4ef77e9c25f5a72c1fcb46f665a20568';

/// 인증 상태를 관리하고 인증 관련 작업을 처리하는 Notifier
///
/// Copied from [Auth].
@ProviderFor(Auth)
final authProvider = AsyncNotifierProvider<Auth, UserModel?>.internal(
  Auth.new,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Auth = AsyncNotifier<UserModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
