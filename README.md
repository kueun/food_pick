# Food Pick App

Flutter로 만든 음식점 추천 및 리뷰 앱입니다.

## 프로젝트 설정

### 1. Flutter 환경 설정
```bash
flutter pub get
```

### 2. 환경변수 설정

#### 2.1 .env 파일 생성
프로젝트 루트 디렉토리에 `.env` 파일을 생성하고 다음 내용을 입력하세요:

```bash
# .env.example 파일을 복사하여 시작할 수 있습니다
cp .env.example .env
```

#### 2.2 환경변수 설정
`.env` 파일에 다음 값들을 설정하세요:

```env
# Supabase 설정
SUPABASE_URL=https://your-project-id.supabase.co
SUPABASE_ANON_KEY=your_supabase_anon_key_here

# Naver Maps API 설정
NAVER_MAP_CLIENT_ID=your_naver_map_client_id_here

# 개발 환경 설정
ENVIRONMENT=development
```

**⚠️ 중요**: 
- `.env` 파일은 민감한 정보를 포함하므로 Git에 커밋하지 마세요.
- 이미 `.gitignore`에 추가되어 있습니다.
- 실제 값으로 교체해야 합니다.

### 3. Supabase 설정

#### 3.1 Supabase 프로젝트 생성
1. [Supabase](https://supabase.com)에서 새 프로젝트를 생성하세요.
2. 프로젝트 대시보드에서 Settings > API로 이동하세요.
3. Project URL과 Anon Key를 복사하여 `.env` 파일에 입력하세요.

#### 3.2 데이터베이스 설정
1. Supabase 대시보드에서 SQL Editor로 이동하세요.
2. `supabase_setup.sql` 파일의 내용을 복사하여 실행하세요.
3. 이 스크립트는 다음을 생성합니다:
   - `users` 테이블
   - RLS (Row Level Security) 정책
   - 프로필 이미지 스토리지 버킷
   - 필요한 트리거와 함수

### 4. Naver Maps API 설정 (선택사항)
1. [Naver Cloud Platform](https://console.ncloud.com/naver-service/application)에 접속하세요.
2. Maps API를 활성화하고 클라이언트 ID를 발급받으세요.
3. 발급받은 클라이언트 ID를 `.env` 파일의 `NAVER_MAP_CLIENT_ID`에 입력하세요.

### 5. 앱 실행
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

### 환경변수 관련 문제
- `.env` 파일이 제대로 로드되지 않는 경우, `flutter clean` 후 다시 실행해보세요.
- 환경변수 값에 특수문자가 있는 경우 따옴표로 감싸주세요.

### 로그인이 안 될 때
1. Supabase 대시보드에서 Authentication > Users를 확인하세요.
2. `users` 테이블이 생성되었는지 확인하세요.
3. RLS 정책이 올바르게 설정되었는지 확인하세요.
4. `.env` 파일의 Supabase URL과 API 키가 올바른지 확인하세요.

### PostgrestException 에러
이 에러는 주로 다음과 같은 경우에 발생합니다:
- 데이터베이스 테이블이 없을 때
- RLS 정책이 제한적일 때
- 네트워크 연결 문제

해결 방법:
1. `supabase_setup.sql` 스크립트를 실행했는지 확인하세요.
2. Supabase 대시보드에서 테이블과 정책을 확인하세요.
3. 인터넷 연결을 확인하세요.
