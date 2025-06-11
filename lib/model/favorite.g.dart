// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteModelImpl _$$FavoriteModelImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteModelImpl(
      id: (json['id'] as num?)?.toInt(),
      foodStoreId: (json['food_store_id'] as num).toInt(),
      favoriteUid: json['favorite_uid'] as String,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$FavoriteModelImplToJson(_$FavoriteModelImpl instance) =>
    <String, dynamic>{
      'food_store_id': instance.foodStoreId,
      'favorite_uid': instance.favoriteUid,
    };
