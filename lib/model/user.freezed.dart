// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  /// 사용자 고유 ID (데이터베이스 자동 생성)
  @JsonKey(includeFromJson: true, includeToJson: false)
  int? get id => throw _privateConstructorUsedError;

  /// Supabase Auth UID
  /// 인증 시스템에서 사용하는 고유 식별자
  String get uid => throw _privateConstructorUsedError;

  /// 사용자 이메일 주소
  /// 로그인 시 사용되는 고유한 식별자
  String get email => throw _privateConstructorUsedError;

  /// 사용자 이름 (닉네임)
  /// 앱 내에서 표시되는 사용자의 이름
  String get name => throw _privateConstructorUsedError;

  /// 프로필 이미지 URL
  /// Supabase Storage에 저장된 이미지의 공개 URL
  String? get profileUrl => throw _privateConstructorUsedError;

  /// 자기소개
  /// 사용자가 작성한 간단한 소개 문구
  String? get introduce => throw _privateConstructorUsedError;

  /// 계정 생성 일시
  @JsonKey(includeFromJson: true, includeToJson: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// 계정 정보 수정 일시
  @JsonKey(includeFromJson: true, includeToJson: false)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    @JsonKey(includeFromJson: true, includeToJson: false) int? id,
    String uid,
    String email,
    String name,
    String? profileUrl,
    String? introduce,
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? createdAt,
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? updatedAt,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? email = null,
    Object? name = null,
    Object? profileUrl = freezed,
    Object? introduce = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            uid:
                null == uid
                    ? _value.uid
                    : uid // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            profileUrl:
                freezed == profileUrl
                    ? _value.profileUrl
                    : profileUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            introduce:
                freezed == introduce
                    ? _value.introduce
                    : introduce // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeFromJson: true, includeToJson: false) int? id,
    String uid,
    String email,
    String name,
    String? profileUrl,
    String? introduce,
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? createdAt,
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? updatedAt,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? email = null,
    Object? name = null,
    Object? profileUrl = freezed,
    Object? introduce = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UserModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        uid:
            null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        profileUrl:
            freezed == profileUrl
                ? _value.profileUrl
                : profileUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        introduce:
            freezed == introduce
                ? _value.introduce
                : introduce // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl({
    @JsonKey(includeFromJson: true, includeToJson: false) this.id,
    required this.uid,
    required this.email,
    required this.name,
    this.profileUrl,
    this.introduce,
    @JsonKey(includeFromJson: true, includeToJson: false) this.createdAt,
    @JsonKey(includeFromJson: true, includeToJson: false) this.updatedAt,
  }) : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  /// 사용자 고유 ID (데이터베이스 자동 생성)
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  final int? id;

  /// Supabase Auth UID
  /// 인증 시스템에서 사용하는 고유 식별자
  @override
  final String uid;

  /// 사용자 이메일 주소
  /// 로그인 시 사용되는 고유한 식별자
  @override
  final String email;

  /// 사용자 이름 (닉네임)
  /// 앱 내에서 표시되는 사용자의 이름
  @override
  final String name;

  /// 프로필 이미지 URL
  /// Supabase Storage에 저장된 이미지의 공개 URL
  @override
  final String? profileUrl;

  /// 자기소개
  /// 사용자가 작성한 간단한 소개 문구
  @override
  final String? introduce;

  /// 계정 생성 일시
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  final DateTime? createdAt;

  /// 계정 정보 수정 일시
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, uid: $uid, email: $email, name: $name, profileUrl: $profileUrl, introduce: $introduce, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl) &&
            (identical(other.introduce, introduce) ||
                other.introduce == introduce) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    uid,
    email,
    name,
    profileUrl,
    introduce,
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel({
    @JsonKey(includeFromJson: true, includeToJson: false) final int? id,
    required final String uid,
    required final String email,
    required final String name,
    final String? profileUrl,
    final String? introduce,
    @JsonKey(includeFromJson: true, includeToJson: false)
    final DateTime? createdAt,
    @JsonKey(includeFromJson: true, includeToJson: false)
    final DateTime? updatedAt,
  }) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  /// 사용자 고유 ID (데이터베이스 자동 생성)
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  int? get id;

  /// Supabase Auth UID
  /// 인증 시스템에서 사용하는 고유 식별자
  @override
  String get uid;

  /// 사용자 이메일 주소
  /// 로그인 시 사용되는 고유한 식별자
  @override
  String get email;

  /// 사용자 이름 (닉네임)
  /// 앱 내에서 표시되는 사용자의 이름
  @override
  String get name;

  /// 프로필 이미지 URL
  /// Supabase Storage에 저장된 이미지의 공개 URL
  @override
  String? get profileUrl;

  /// 자기소개
  /// 사용자가 작성한 간단한 소개 문구
  @override
  String? get introduce;

  /// 계정 생성 일시
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  DateTime? get createdAt;

  /// 계정 정보 수정 일시
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  DateTime? get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
