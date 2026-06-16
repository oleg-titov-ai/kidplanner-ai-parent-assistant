-- KidPlanner AI Parent Assistant
-- PostgreSQL demo schema
-- Safe public version. No real user data.

CREATE TABLE IF NOT EXISTS users_tariff_kidplanner (
    id BIGSERIAL PRIMARY KEY,
    telegram_user_id TEXT NOT NULL UNIQUE,
    telegram_chat_id TEXT NOT NULL,
    username TEXT,
    first_name TEXT,
    last_name TEXT,
    tariff TEXT NOT NULL DEFAULT 'free',
    request_limit INTEGER NOT NULL DEFAULT 5,
    requests_used INTEGER NOT NULL DEFAULT 0,
    extra_requests INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    last_sent_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS message_history_kidplanner (
    id BIGSERIAL PRIMARY KEY,
    telegram_user_id TEXT NOT NULL,
    telegram_chat_id TEXT NOT NULL,
    role TEXT NOT NULL CHECK (role IN ('user', 'assistant', 'system')),
    message_text TEXT NOT NULL,
    tokens_used INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS payments_kidplanner (
    id BIGSERIAL PRIMARY KEY,
    telegram_user_id TEXT NOT NULL,
    provider TEXT NOT NULL DEFAULT 'demo_provider',
    provider_payment_id TEXT,
    amount NUMERIC(12, 2) NOT NULL DEFAULT 0,
    currency TEXT NOT NULL DEFAULT 'RUB',
    status TEXT NOT NULL DEFAULT 'pending',
    extra_requests_added INTEGER NOT NULL DEFAULT 0,
    raw_payload JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS daily_tips_kidplanner (
    id BIGSERIAL PRIMARY KEY,
    tip_text TEXT NOT NULL,
    language TEXT NOT NULL DEFAULT 'ru',
    age_group TEXT DEFAULT 'general',
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_kidplanner_users_telegram_user_id
    ON users_tariff_kidplanner (telegram_user_id);

CREATE INDEX IF NOT EXISTS idx_kidplanner_history_user_created
    ON message_history_kidplanner (telegram_user_id, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_kidplanner_payments_user_status
    ON payments_kidplanner (telegram_user_id, status);

CREATE INDEX IF NOT EXISTS idx_kidplanner_daily_tips_active
    ON daily_tips_kidplanner (is_active, language, age_group);
