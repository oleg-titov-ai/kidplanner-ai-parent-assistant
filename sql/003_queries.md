# Useful SQL Queries

These queries are for local testing and demo inspection.

---

## Check Users and Limits

```sql
SELECT
    telegram_user_id,
    username,
    tariff,
    request_limit,
    requests_used,
    extra_requests,
    is_active,
    created_at
FROM users_tariff_kidplanner
ORDER BY created_at DESC;
```

---

## Check Remaining Requests

```sql
SELECT
    telegram_user_id,
    username,
    tariff,
    request_limit,
    requests_used,
    extra_requests,
    (request_limit + extra_requests - requests_used) AS remaining_requests
FROM users_tariff_kidplanner
ORDER BY created_at DESC;
```

---

## Check Message History

```sql
SELECT
    telegram_user_id,
    role,
    message_text,
    tokens_used,
    created_at
FROM message_history_kidplanner
ORDER BY created_at DESC
LIMIT 50;
```

---

## Check Successful Payments

```sql
SELECT
    telegram_user_id,
    provider,
    provider_payment_id,
    amount,
    currency,
    status,
    extra_requests_added,
    created_at
FROM payments_kidplanner
WHERE status = 'succeeded'
ORDER BY created_at DESC;
```

---

## Check Daily Tips

```sql
SELECT
    id,
    language,
    age_group,
    tip_text,
    is_active,
    created_at
FROM daily_tips_kidplanner
WHERE is_active = TRUE
ORDER BY created_at DESC;
```

---

## Reset Demo User Limit

```sql
UPDATE users_tariff_kidplanner
SET
    requests_used = 0,
    extra_requests = 0,
    updated_at = now()
WHERE telegram_user_id = 'DEMO_USER_ID';
```

---

## Add Extra Demo Requests

```sql
UPDATE users_tariff_kidplanner
SET
    extra_requests = extra_requests + 50,
    updated_at = now()
WHERE telegram_user_id = 'DEMO_USER_ID';
```
