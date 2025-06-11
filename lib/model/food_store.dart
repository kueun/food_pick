import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_store.freezed.dart';
part 'food_store.g.dart';

/// 음식점 정보를 나타내는 모델 클래스 (Freezed 적용)
///
/// 사용자가 등록한 음식점의 정보를 불변(immutable) 객체로 관리합니다.
@freezed
class FoodStoreModel with _$FoodStoreModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FoodStoreModel({
    /// 음식점 고유 ID (데이터베이스 자동 생성)
    @JsonKey(includeFromJson: true, includeToJson: false) int? id,

    /// 음식점을 등록한 사용자의 ID
    required String uid,

    /// 음식점 이름
    required String storeName,

    /// 음식점에 대한 코멘트 또는 설명
    required String storeComment,

    /// 음식점 이미지 URL (선택사항)
    String? storeImgUrl,

    /// 음식점의 위도 좌표
    required double latitude,

    /// 음식점의 경도 좌표
    required double longitude,

    /// 음식점 정보 생성 일시
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? createdAt,
  }) = _FoodStoreModel;

  /// JSON 데이터로부터 FoodStoreModel 객체를 생성하는 팩토리 메서드
  factory FoodStoreModel.fromJson(Map<String, dynamic> json) =>
      _$FoodStoreModelFromJson(json);
}
