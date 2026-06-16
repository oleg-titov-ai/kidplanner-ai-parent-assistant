-- KidPlanner AI Parent Assistant
-- Demo data only. No real users, chats, children, or payments.

INSERT INTO users_tariff_kidplanner (
    telegram_user_id,
    telegram_chat_id,
    username,
    first_name,
    last_name,
    tariff,
    request_limit,
    requests_used,
    extra_requests,
    is_active
)
VALUES (
    'DEMO_USER_ID',
    'DEMO_CHAT_ID',
    'demo_parent',
    'Demo',
    'Parent',
    'free',
    5,
    2,
    0,
    TRUE
)
ON CONFLICT (telegram_user_id) DO UPDATE
SET
    telegram_chat_id = EXCLUDED.telegram_chat_id,
    username = EXCLUDED.username,
    first_name = EXCLUDED.first_name,
    last_name = EXCLUDED.last_name,
    tariff = EXCLUDED.tariff,
    request_limit = EXCLUDED.request_limit,
    requests_used = EXCLUDED.requests_used,
    extra_requests = EXCLUDED.extra_requests,
    is_active = EXCLUDED.is_active,
    updated_at = now();

INSERT INTO message_history_kidplanner (
    telegram_user_id,
    telegram_chat_id,
    role,
    message_text,
    tokens_used
)
VALUES
(
    'DEMO_USER_ID',
    'DEMO_CHAT_ID',
    'user',
    'My child does not want to go to bed on time. What can I do?',
    0
),
(
    'DEMO_USER_ID',
    'DEMO_CHAT_ID',
    'assistant',
    'Try creating a predictable evening routine: quiet play, bath, short story, lights out at the same time every day. Avoid screens before bedtime and keep the tone calm.',
    120
);

INSERT INTO daily_tips_kidplanner (tip_text, language, age_group)
VALUES
('Spend 10 minutes today giving your child focused attention without phone or distractions.', 'en', 'general'),
('Перед сном лучше повторять один и тот же спокойный ритуал: умывание, книга, объятие, сон.', 'ru', 'general'),
('Offer two acceptable choices instead of asking an open-ended question: “Do you want the red cup or the blue cup?”', 'en', 'toddlers');

INSERT INTO payments_kidplanner (
    telegram_user_id,
    provider,
    provider_payment_id,
    amount,
    currency,
    status,
    extra_requests_added,
    raw_payload
)
VALUES (
    'DEMO_USER_ID',
    'demo_provider',
    'DEMO_PAYMENT_ID',
    199.00,
    'RUB',
    'succeeded',
    50,
    jsonb_build_object(
        'demo', true,
        'event', 'payment.succeeded'
    )
);
