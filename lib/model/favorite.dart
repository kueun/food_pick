import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

/// 즐겨찾기 정보를 나타내는 모델 클래스 (Freezed 적용)
///
/// 사용자와 음식점 간의 즐겨찾기 관계를 불변(immutable) 객체로 관리합니다.
@freezed
class FavoriteModel with _$FavoriteModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FavoriteModel({
    /// 즐겨찾기 고유 ID (데이터베이스 자동 생성)
    @JsonKey(includeFromJson: true, includeToJson: false) int? id,

    /// 즐겨찾기한 음식점의 ID
    /// food_store 테이블의 id를 참조합니다.
    required int foodStoreId,

    /// 즐겨찾기를 한 사용자의 UID
    /// auth.users 테이블의 id를 참조합니다.
    required String favoriteUid,

    /// 즐겨찾기 생성 일시
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? createdAt,
  }) = _FavoriteModel;

  /// JSON 데이터로부터 FavoriteModel 객체를 생성하는 팩토리 메서드
  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
}
