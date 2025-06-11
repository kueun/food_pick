# Food Pick App

Flutter로 만든 음식점 추천 및 리뷰 앱입니다.

## 프로젝트 설정

### 1. Flutter 환경 설정
```bash
flutter pub get
```

### 2. Supabase 설정

#### 2.1 Supabase 프로젝트 생성
1. [Supabase](https://supabase.com)에서 새 프로젝트를 생성하세요.
2. 프로젝트 대시보드에서 Settings > API로 이동하세요.
3. Project URL과 Anon Key를 복사하세요.

#### 2.2 환경 변수 설정 (선택사항)
`.env` 파일을 생성하고 다음 내용을 입력하세요:
```
SUPABASE_URL=your-project-url
SUPABASE_ANON_KEY=your-anon-key
NAVER_MAP_CLIENT_ID=your-naver-map-client-id
```

**참고**: 현재 `lib/config/app_config.dart`에 기본값이 하드코딩되어 있습니다.
프로덕션 환경에서는 반드시 `.env` 파일을 사용하세요.

#### 2.3 데이터베이스 설정
1. Supabase 대시보드에서 SQL Editor로 이동하세요.
2. `supabase_setup.sql` 파일의 내용을 복사하여 실행하세요.
3. 이 스크립트는 다음을 생성합니다:
   - `users` 테이블
   - RLS (Row Level Security) 정책
   - 프로필 이미지 스토리지 버킷
   - 필요한 트리거와 함수

### 3. 앱 실행
```bash
flutter run
```

## 주요 기능
- 이메일 로그인/회원가입
- 사용자 프로필 관리
- 음식점 검색 및 리뷰
- 즐겨찾기 기능
- 지도 기반 위치 표시

## 기술 스택
- Flutter 3.29.3
- Riverpod (상태 관리)
- Supabase (백엔드)
- GoRouter (라우팅)
- Freezed (데이터 모델)
- Naver Maps (지도)

## 문제 해결

### 로그인이 안 될 때
1. Supabase 대시보드에서 Authentication > Users를 확인하세요.
2. `users` 테이블이 생성되었는지 확인하세요.
3. RLS 정책이 올바르게 설정되었는지 확인하세요.
4. Supabase URL과 API 키가 올바른지 확인하세요.

### PostgrestException 에러
이 에러는 주로 다음과 같은 경우에 발생합니다:
- 데이터베이스 테이블이 없을 때
- RLS 정책이 제한적일 때
- 네트워크 연결 문제

해결 방법:
1. `supabase_setup.sql` 스크립트를 실행했는지 확인하세요.
2. Supabase 대시보드에서 테이블과 정책을 확인하세요.
3. 인터넷 연결을 확인하세요.
