```mermaid
graph TD
    %% 앱 진입점 및 설정 레이어
    subgraph "앱 진입점 및 설정"
        A[main.dart<br/>앱 진입점] --> B[AppRouter<br/>라우팅 설정];
        A --> C[AppTheme<br/>테마 설정];
        A --> D[ProviderScope<br/>상태관리 범위];
        A --> E[Service Initialization<br/>서비스 초기화];
        A --> F[SupabaseConfig<br/>데이터베이스 설정];
        A --> G[NaverMapConfig<br/>네이버맵 설정];
        A --> H[AppConfig<br/>앱 설정];
        A --> I[.env File<br/>환경변수];
    end

    %% UI 레이어 - 화면들
    subgraph "UI 레이어 - 화면"
        direction TB
        S_Splash[SplashScreen<br/>스플래시 화면] --> B;
        S_Login[LoginScreen<br/>로그인 화면] --> P_Auth;
        S_Register[RegisterScreen<br/>회원가입 화면] --> P_Auth;
        S_Main[MainScreen<br/>메인 화면] --> S_Home;
        S_Main --> S_Favorite;
        S_Main --> S_MyInfo;
        S_Home[HomeScreen<br/>홈 화면] --> P_Location;
        S_Favorite[FavoriteScreen<br/>즐겨찾기 화면];
        S_MyInfo[MyInfoScreen<br/>내 정보 화면] --> P_Auth;
    end

    %% UI 레이어 - 위젯들
    subgraph "UI 레이어 - 재사용 위젯"
        direction LR
        W_ErrorPage[ErrorPage<br/>에러 페이지];
        W_AppLogo[AppLogo<br/>앱 로고];
        W_ErrorDisplay[ErrorDisplay<br/>에러 표시];
        W_ImagePicker[ImagePickerOption<br/>이미지 선택];
        W_AppBars[AppBars<br/>앱바 위젯];
        W_Buttons[Buttons<br/>버튼 위젯];
        W_TextFields[TextFields<br/>텍스트 필드];
        W_Texts[Texts<br/>텍스트 위젯];
    end

    %% 상태 관리 레이어 (Riverpod)
    subgraph "상태 관리 (Riverpod)"
        direction TB
        D --> P_Auth[authProvider<br/>인증 상태 관리];
        D --> P_Location[locationProvider<br/>위치 상태 관리];
        D --> P_Supabase[supabaseClientProvider<br/>데이터베이스 클라이언트];
        P_Auth --> P_AuthState[authStateChangesProvider<br/>인증 상태 변경 감지];
        P_Auth --> P_IsLoggedIn[isLoggedInProvider<br/>로그인 여부 확인];
        P_Auth --> P_SupabaseUser[supabaseUserProvider<br/>현재 사용자 정보];
    end

    %% 서비스 레이어
    subgraph "서비스 레이어"
        direction TB
        SVC_Supabase[SupabaseService<br/>데이터베이스 서비스] --> P_Auth;
        SVC_Supabase --> SVC_SupabaseProvider[supabaseServiceProvider<br/>서비스 제공자];
        P_Location --> SVC_Geolocator[Geolocator API<br/>위치 서비스];
    end

    %% 데이터 모델 레이어
    subgraph "데이터 모델 (Freezed)"
        direction LR
        M_User[UserModel<br/>사용자 모델] --> M_UserFreezed[user.freezed.dart<br/>불변 클래스 생성];
        M_User --> M_UserJson[user.g.dart<br/>JSON 직렬화];
        M_Food[FoodStoreModel<br/>음식점 모델] --> M_FoodFreezed[food_store.freezed.dart<br/>불변 클래스 생성];
        M_Food --> M_FoodJson[food_store.g.dart<br/>JSON 직렬화];
        M_Fav[FavoriteModel<br/>즐겨찾기 모델] --> M_FavFreezed[favorite.freezed.dart<br/>불변 클래스 생성];
        M_Fav --> M_FavJson[favorite.g.dart<br/>JSON 직렬화];
    end

    %% 데이터베이스 및 외부 서비스
    subgraph "외부 서비스"
        direction TB
        DB_Supabase[(Supabase Database<br/>데이터베이스)];
        ST_Supabase[(Supabase Storage<br/>파일 저장소)];
        API_NaverMap[Naver Map API<br/>네이버 지도];
        API_Geolocator[Geolocator API<br/>위치 정보];
    end

    %% 라우팅 시스템
    subgraph "라우팅 (GoRouter)"
        B --> R{Route Navigation<br/>경로 탐색};
        R -- "/" --> S_Splash;
        R -- "/login" --> S_Login;
        R -- "/register" --> S_Register;
        R -- "/main" --> S_Main;
        R -- "Error" --> W_ErrorPage;
    end

    %% 위젯 사용 관계
    S_Login --> W_AppLogo;
    S_Login --> W_ErrorDisplay;
    S_Login --> W_TextFields;
    S_Login --> W_Buttons;
    S_Register --> W_ErrorDisplay;
    S_Register --> W_ImagePicker;
    S_Register --> W_TextFields;
    S_Register --> W_Buttons;
    S_Main --> W_AppBars;
    S_Home --> W_Texts;
    S_MyInfo --> W_Buttons;
    S_MyInfo --> W_Texts;

    %% 데이터 흐름 연결
    SVC_Supabase --> M_User;
    SVC_Supabase --> M_Food;
    SVC_Supabase --> M_Fav;
    SVC_Supabase --> DB_Supabase;
    SVC_Supabase --> ST_Supabase;
    
    %% 설정 연결
    F --> DB_Supabase;
    G --> API_NaverMap;
    H --> G;
    I --> F;
    I --> G;

    %% Provider 의존성
    P_Auth --> SVC_SupabaseProvider;
    P_Supabase --> F;
    SVC_SupabaseProvider --> P_Supabase;

    %% 테마 사용
    C --> S_Login;
    C --> S_Register;
    C --> S_Main;
    C --> S_Home;
    C --> S_Favorite;
    C --> S_MyInfo;
    C --> W_AppBars;
    C --> W_Buttons;
    C --> W_TextFields;
    C --> W_Texts;

    %% Build Runner 생성 파일들
    subgraph "코드 자동 생성"
        direction TB
        BR[build_runner<br/>코드 생성 도구] --> M_UserFreezed;
        BR --> M_UserJson;
        BR --> M_FoodFreezed;
        BR --> M_FoodJson;
        BR --> M_FavFreezed;
        BR --> M_FavJson;
        BR --> P_AuthGen[auth_provider.g.dart<br/>인증 Provider 생성];
        BR --> P_LocationGen[location_provider.g.dart<br/>위치 Provider 생성];
        BR --> SVC_SupabaseGen[supabase_service.g.dart<br/>서비스 Provider 생성];
    end

    %% 생성된 파일 의존성
    P_Auth --> P_AuthGen;
    P_Location --> P_LocationGen;
    SVC_SupabaseProvider --> SVC_SupabaseGen;

    %% 스타일링 및 색상 코딩
    classDef config fill:#E8F4FD,stroke:#1976D2,stroke-width:2px,color:#000;
    classDef screen fill:#E8F5E8,stroke:#4CAF50,stroke-width:2px,color:#000;
    classDef widget fill:#FFF3E0,stroke:#FF9800,stroke-width:2px,color:#000;
    classDef provider fill:#F3E5F5,stroke:#9C27B0,stroke-width:2px,color:#000;
    classDef service fill:#FFEBEE,stroke:#F44336,stroke-width:2px,color:#000;
    classDef model fill:#E0F2F1,stroke:#009688,stroke-width:2px,color:#000;
    classDef external fill:#FFF8E1,stroke:#FFC107,stroke-width:2px,color:#000;
    classDef route fill:#FCE4EC,stroke:#E91E63,stroke-width:2px,color:#000;
    classDef generated fill:#F1F8E9,stroke:#8BC34A,stroke-width:2px,color:#000;

    %% 스타일 적용
    class A,B,C,D,E,F,G,H,I config;
    class S_Splash,S_Login,S_Register,S_Main,S_Home,S_Favorite,S_MyInfo screen;
    class W_ErrorPage,W_AppLogo,W_ErrorDisplay,W_ImagePicker,W_AppBars,W_Buttons,W_TextFields,W_Texts widget;
    class P_Auth,P_Location,P_Supabase,P_AuthState,P_IsLoggedIn,P_SupabaseUser provider;
    class SVC_Supabase,SVC_SupabaseProvider,SVC_Geolocator service;
    class M_User,M_Food,M_Fav model;
    class DB_Supabase,ST_Supabase,API_NaverMap,API_Geolocator external;
    class R,B route;
    class M_UserFreezed,M_UserJson,M_FoodFreezed,M_FoodJson,M_FavFreezed,M_FavJson,P_AuthGen,P_LocationGen,SVC_SupabaseGen,BR generated;