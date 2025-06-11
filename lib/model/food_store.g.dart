// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodStoreModelImpl _$$FoodStoreModelImplFromJson(Map<String, dynamic> json) =>
    _$FoodStoreModelImpl(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      storeName: json['store_name'] as String,
      storeComment: json['store_comment'] as String,
      storeImgUrl: json['store_img_url'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$FoodStoreModelImplToJson(
  _$FoodStoreModelImpl instance,
) => <String, dynamic>{
  'uid': instance.uid,
  'store_name': instance.storeName,
  'store_comment': instance.storeComment,
  'store_img_url': instance.storeImgUrl,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
