// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) {
  return _FavoriteModel.fromJson(json);
}

/// @nodoc
mixin _$FavoriteModel {
  /// 즐겨찾기 고유 ID (데이터베이스 자동 생성)
  @JsonKey(includeFromJson: true, includeToJson: false)
  int? get id => throw _privateConstructorUsedError;

  /// 즐겨찾기한 음식점의 ID
  /// food_store 테이블의 id를 참조합니다.
  int get foodStoreId => throw _privateConstructorUsedError;

  /// 즐겨찾기를 한 사용자의 UID
  /// auth.users 테이블의 id를 참조합니다.
  String get favoriteUid => throw _privateConstructorUsedError;

  /// 즐겨찾기 생성 일시
  @JsonKey(includeFromJson: true, includeToJson: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FavoriteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteModelCopyWith<FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteModelCopyWith<$Res> {
  factory $FavoriteModelCopyWith(
    FavoriteModel value,
    $Res Function(FavoriteModel) then,
  ) = _$FavoriteModelCopyWithImpl<$Res, FavoriteModel>;
  @useResult
  $Res call({
    @JsonKey(includeFromJson: true, includeToJson: false) int? id,
    int foodStoreId,
    String favoriteUid,
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? createdAt,
  });
}

/// @nodoc
class _$FavoriteModelCopyWithImpl<$Res, $Val extends FavoriteModel>
    implements $FavoriteModelCopyWith<$Res> {
  _$FavoriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? foodStoreId = null,
    Object? favoriteUid = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            foodStoreId:
                null == foodStoreId
                    ? _value.foodStoreId
                    : foodStoreId // ignore: cast_nullable_to_non_nullable
                        as int,
            favoriteUid:
                null == favoriteUid
                    ? _value.favoriteUid
                    : favoriteUid // ignore: cast_nullable_to_non_nullable
                        as String,
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
abstract class _$$FavoriteModelImplCopyWith<$Res>
    implements $FavoriteModelCopyWith<$Res> {
  factory _$$FavoriteModelImplCopyWith(
    _$FavoriteModelImpl value,
    $Res Function(_$FavoriteModelImpl) then,
  ) = __$$FavoriteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeFromJson: true, includeToJson: false) int? id,
    int foodStoreId,
    String favoriteUid,
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? createdAt,
  });
}

/// @nodoc
class __$$FavoriteModelImplCopyWithImpl<$Res>
    extends _$FavoriteModelCopyWithImpl<$Res, _$FavoriteModelImpl>
    implements _$$FavoriteModelImplCopyWith<$Res> {
  __$$FavoriteModelImplCopyWithImpl(
    _$FavoriteModelImpl _value,
    $Res Function(_$FavoriteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? foodStoreId = null,
    Object? favoriteUid = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$FavoriteModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        foodStoreId:
            null == foodStoreId
                ? _value.foodStoreId
                : foodStoreId // ignore: cast_nullable_to_non_nullable
                    as int,
        favoriteUid:
            null == favoriteUid
                ? _value.favoriteUid
                : favoriteUid // ignore: cast_nullable_to_non_nullable
                    as String,
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
class _$FavoriteModelImpl implements _FavoriteModel {
  const _$FavoriteModelImpl({
    @JsonKey(includeFromJson: true, includeToJson: false) this.id,
    required this.foodStoreId,
    required this.favoriteUid,
    @JsonKey(includeFromJson: true, includeToJson: false) this.createdAt,
  });

  factory _$FavoriteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteModelImplFromJson(json);

  /// 즐겨찾기 고유 ID (데이터베이스 자동 생성)
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  final int? id;

  /// 즐겨찾기한 음식점의 ID
  /// food_store 테이블의 id를 참조합니다.
  @override
  final int foodStoreId;

  /// 즐겨찾기를 한 사용자의 UID
  /// auth.users 테이블의 id를 참조합니다.
  @override
  final String favoriteUid;

  /// 즐겨찾기 생성 일시
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FavoriteModel(id: $id, foodStoreId: $foodStoreId, favoriteUid: $favoriteUid, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.foodStoreId, foodStoreId) ||
                other.foodStoreId == foodStoreId) &&
            (identical(other.favoriteUid, favoriteUid) ||
                other.favoriteUid == favoriteUid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, foodStoreId, favoriteUid, createdAt);

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteModelImplCopyWith<_$FavoriteModelImpl> get copyWith =>
      __$$FavoriteModelImplCopyWithImpl<_$FavoriteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteModelImplToJson(this);
  }
}

abstract class _FavoriteModel implements FavoriteModel {
  const factory _FavoriteModel({
    @JsonKey(includeFromJson: true, includeToJson: false) final int? id,
    required final int foodStoreId,
    required final String favoriteUid,
    @JsonKey(includeFromJson: true, includeToJson: false)
    final DateTime? createdAt,
  }) = _$FavoriteModelImpl;

  factory _FavoriteModel.fromJson(Map<String, dynamic> json) =
      _$FavoriteModelImpl.fromJson;

  /// 즐겨찾기 고유 ID (데이터베이스 자동 생성)
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  int? get id;

  /// 즐겨찾기한 음식점의 ID
  /// food_store 테이블의 id를 참조합니다.
  @override
  int get foodStoreId;

  /// 즐겨찾기를 한 사용자의 UID
  /// auth.users 테이블의 id를 참조합니다.
  @override
  String get favoriteUid;

  /// 즐겨찾기 생성 일시
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  DateTime? get createdAt;

  /// Create a copy of FavoriteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteModelImplCopyWith<_$FavoriteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
