import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// 사용자 정보를 나타내는 모델 클래스 (Freezed 적용)
///
/// 데이터베이스의 'users' 테이블과 매핑되며,
/// 사용자의 프로필 정보를 불변(immutable) 객체로 관리합니다.
@freezed
class UserModel with _$UserModel {
  /// private constructor for Freezed
  const UserModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserModel({
    /// 사용자 고유 ID (데이터베이스 자동 생성)
    @JsonKey(includeFromJson: true, includeToJson: false) int? id,

    /// Supabase Auth UID
    /// 인증 시스템에서 사용하는 고유 식별자
    required String uid,

    /// 사용자 이메일 주소
    /// 로그인 시 사용되는 고유한 식별자
    required String email,

    /// 사용자 이름 (닉네임)
    /// 앱 내에서 표시되는 사용자의 이름
    required String name,

    /// 프로필 이미지 URL
    /// Supabase Storage에 저장된 이미지의 공개 URL
    String? profileUrl,

    /// 자기소개
    /// 사용자가 작성한 간단한 소개 문구
    String? introduce,

    /// 계정 생성 일시
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? createdAt,

    /// 계정 정보 수정 일시
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? updatedAt,
  }) = _UserModel;

  /// JSON 데이터로부터 UserModel 객체를 생성하는 팩토리 메서드
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

// Freezed와 json_serializable이 자동으로 생성하는 코드:
// - user.freezed.dart: Freezed가 생성하는 불변 클래스 구현
// - user.g.dart: JSON 직렬화/역직렬화 코드
//
// 코드 생성 명령어:
// flutter pub run build_runner build --delete-conflicting-outputs
