// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FoodStoreModel _$FoodStoreModelFromJson(Map<String, dynamic> json) {
  return _FoodStoreModel.fromJson(json);
}

/// @nodoc
mixin _$FoodStoreModel {
  /// 음식점 고유 ID (데이터베이스 자동 생성)
  @JsonKey(includeFromJson: true, includeToJson: false)
  int? get id => throw _privateConstructorUsedError;

  /// 음식점을 등록한 사용자의 ID
  String get uid => throw _privateConstructorUsedError;

  /// 음식점 이름
  String get storeName => throw _privateConstructorUsedError;

  /// 음식점에 대한 코멘트 또는 설명
  String get storeComment => throw _privateConstructorUsedError;

  /// 음식점 이미지 URL (선택사항)
  String? get storeImgUrl => throw _privateConstructorUsedError;

  /// 음식점의 위도 좌표
  double get latitude => throw _privateConstructorUsedError;

  /// 음식점의 경도 좌표
  double get longitude => throw _privateConstructorUsedError;

  /// 음식점 정보 생성 일시
  @JsonKey(includeFromJson: true, includeToJson: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FoodStoreModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodStoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodStoreModelCopyWith<FoodStoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodStoreModelCopyWith<$Res> {
  factory $FoodStoreModelCopyWith(
    FoodStoreModel value,
    $Res Function(FoodStoreModel) then,
  ) = _$FoodStoreModelCopyWithImpl<$Res, FoodStoreModel>;
  @useResult
  $Res call({
    @JsonKey(includeFromJson: true, includeToJson: false) int? id,
    String uid,
    String storeName,
    String storeComment,
    String? storeImgUrl,
    double latitude,
    double longitude,
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? createdAt,
  });
}

/// @nodoc
class _$FoodStoreModelCopyWithImpl<$Res, $Val extends FoodStoreModel>
    implements $FoodStoreModelCopyWith<$Res> {
  _$FoodStoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodStoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? storeName = null,
    Object? storeComment = null,
    Object? storeImgUrl = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? createdAt = freezed,
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
            storeName:
                null == storeName
                    ? _value.storeName
                    : storeName // ignore: cast_nullable_to_non_nullable
                        as String,
            storeComment:
                null == storeComment
                    ? _value.storeComment
                    : storeComment // ignore: cast_nullable_to_non_nullable
                        as String,
            storeImgUrl:
                freezed == storeImgUrl
                    ? _value.storeImgUrl
                    : storeImgUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            latitude:
                null == latitude
                    ? _value.latitude
                    : latitude // ignore: cast_nullable_to_non_nullable
                        as double,
            longitude:
                null == longitude
                    ? _value.longitude
                    : longitude // ignore: cast_nullable_to_non_nullable
                        as double,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FoodStoreModelImplCopyWith<$Res>
    implements $FoodStoreModelCopyWith<$Res> {
  factory _$$FoodStoreModelImplCopyWith(
    _$FoodStoreModelImpl value,
    $Res Function(_$FoodStoreModelImpl) then,
  ) = __$$FoodStoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeFromJson: true, includeToJson: false) int? id,
    String uid,
    String storeName,
    String storeComment,
    String? storeImgUrl,
    double latitude,
    double longitude,
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? createdAt,
  });
}

/// @nodoc
class __$$FoodStoreModelImplCopyWithImpl<$Res>
    extends _$FoodStoreModelCopyWithImpl<$Res, _$FoodStoreModelImpl>
    implements _$$FoodStoreModelImplCopyWith<$Res> {
  __$$FoodStoreModelImplCopyWithImpl(
    _$FoodStoreModelImpl _value,
    $Res Function(_$FoodStoreModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FoodStoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? storeName = null,
    Object? storeComment = null,
    Object? storeImgUrl = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$FoodStoreModelImpl(
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
        storeName:
            null == storeName
                ? _value.storeName
                : storeName // ignore: cast_nullable_to_non_nullable
                    as String,
        storeComment:
            null == storeComment
                ? _value.storeComment
                : storeComment // ignore: cast_nullable_to_non_nullable
                    as String,
        storeImgUrl:
            freezed == storeImgUrl
                ? _value.storeImgUrl
                : storeImgUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        latitude:
            null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                    as double,
        longitude:
            null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                    as double,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FoodStoreModelImpl implements _FoodStoreModel {
  const _$FoodStoreModelImpl({
    @JsonKey(includeFromJson: true, includeToJson: false) this.id,
    required this.uid,
    required this.storeName,
    required this.storeComment,
    this.storeImgUrl,
    required this.latitude,
    required this.longitude,
    @JsonKey(includeFromJson: true, includeToJson: false) this.createdAt,
  });

  factory _$FoodStoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodStoreModelImplFromJson(json);

  /// 음식점 고유 ID (데이터베이스 자동 생성)
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  final int? id;

  /// 음식점을 등록한 사용자의 ID
  @override
  final String uid;

  /// 음식점 이름
  @override
  final String storeName;

  /// 음식점에 대한 코멘트 또는 설명
  @override
  final String storeComment;

  /// 음식점 이미지 URL (선택사항)
  @override
  final String? storeImgUrl;

  /// 음식점의 위도 좌표
  @override
  final double latitude;

  /// 음식점의 경도 좌표
  @override
  final double longitude;

  /// 음식점 정보 생성 일시
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FoodStoreModel(id: $id, uid: $uid, storeName: $storeName, storeComment: $storeComment, storeImgUrl: $storeImgUrl, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodStoreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeComment, storeComment) ||
                other.storeComment == storeComment) &&
            (identical(other.storeImgUrl, storeImgUrl) ||
                other.storeImgUrl == storeImgUrl) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    uid,
    storeName,
    storeComment,
    storeImgUrl,
    latitude,
    longitude,
    createdAt,
  );

  /// Create a copy of FoodStoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodStoreModelImplCopyWith<_$FoodStoreModelImpl> get copyWith =>
      __$$FoodStoreModelImplCopyWithImpl<_$FoodStoreModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodStoreModelImplToJson(this);
  }
}

abstract class _FoodStoreModel implements FoodStoreModel {
  const factory _FoodStoreModel({
    @JsonKey(includeFromJson: true, includeToJson: false) final int? id,
    required final String uid,
    required final String storeName,
    required final String storeComment,
    final String? storeImgUrl,
    required final double latitude,
    required final double longitude,
    @JsonKey(includeFromJson: true, includeToJson: false)
    final DateTime? createdAt,
  }) = _$FoodStoreModelImpl;

  factory _FoodStoreModel.fromJson(Map<String, dynamic> json) =
      _$FoodStoreModelImpl.fromJson;

  /// 음식점 고유 ID (데이터베이스 자동 생성)
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  int? get id;

  /// 음식점을 등록한 사용자의 ID
  @override
  String get uid;

  /// 음식점 이름
  @override
  String get storeName;

  /// 음식점에 대한 코멘트 또는 설명
  @override
  String get storeComment;

  /// 음식점 이미지 URL (선택사항)
  @override
  String? get storeImgUrl;

  /// 음식점의 위도 좌표
  @override
  double get latitude;

  /// 음식점의 경도 좌표
  @override
  double get longitude;

  /// 음식점 정보 생성 일시
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  DateTime? get createdAt;

  /// Create a copy of FoodStoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodStoreModelImplCopyWith<_$FoodStoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
