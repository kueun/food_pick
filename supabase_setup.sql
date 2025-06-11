-- Supabase 데이터베이스 설정 SQL
-- 이 스크립트를 Supabase 대시보드의 SQL Editor에서 실행하세요.

-- users 테이블 생성
CREATE TABLE IF NOT EXISTS public.users (
    id SERIAL PRIMARY KEY,
    uid UUID NOT NULL UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    profile_url TEXT,
    introduce TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    is_deleted BOOLEAN DEFAULT FALSE NOT NULL
);

-- RLS (Row Level Security) 활성화
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- RLS 정책 설정
-- 사용자는 자신의 프로필만 읽을 수 있음
CREATE POLICY "Users can view own profile" ON public.users
    FOR SELECT USING (auth.uid() = uid);

-- 사용자는 자신의 프로필만 업데이트할 수 있음
CREATE POLICY "Users can update own profile" ON public.users
    FOR UPDATE USING (auth.uid() = uid);

-- 사용자는 자신의 프로필을 생성할 수 있음
CREATE POLICY "Users can insert own profile" ON public.users
    FOR INSERT WITH CHECK (auth.uid() = uid);

-- updated_at 자동 업데이트를 위한 트리거 함수
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc'::text, NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- updated_at 트리거 생성
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON public.users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- 프로필 이미지 스토리지 버킷 생성 (이미 존재할 수 있음)
INSERT INTO storage.buckets (id, name, public)
VALUES ('profile-images', 'profile-images', true)
ON CONFLICT (id) DO NOTHING;

-- 스토리지 정책 설정
-- 인증된 사용자는 프로필 이미지를 업로드할 수 있음
CREATE POLICY "Authenticated users can upload profile images" ON storage.objects
    FOR INSERT WITH CHECK (bucket_id = 'profile-images' AND auth.role() = 'authenticated');

-- 모든 사용자는 프로필 이미지를 볼 수 있음
CREATE POLICY "Profile images are publicly accessible" ON storage.objects
    FOR SELECT USING (bucket_id = 'profile-images');

-- 사용자는 자신의 프로필 이미지를 삭제할 수 있음
CREATE POLICY "Users can delete own profile images" ON storage.objects
    FOR DELETE USING (bucket_id = 'profile-images' AND auth.uid()::text = (storage.foldername(name))[1]); 