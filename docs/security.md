# 🔐 Security Notes

KidPlanner is designed as a public demo / portfolio project.

It must never contain production secrets, real parent messages, real child names, payment data, private infrastructure details, or private webhook URLs.

---

## 🚫 Never Commit

Do not commit:

- Telegram bot token
- OpenAI API key
- payment provider secret keys
- real Telegram `chat_id` values
- real Telegram `user_id` values
- real parent messages
- real child names
- real payment IDs
- real payment receipts
- PostgreSQL passwords
- PostgreSQL connection strings with passwords
- n8n credentials
- private webhook URLs
- `.env` files with real values
- database backups

---

## ✅ Safe Public Placeholders

Use placeholders like:

```text
DEMO_TELEGRAM_BOT_TOKEN
DEMO_OPENAI_API_KEY
DEMO_SHOP_ID
DEMO_SECRET_KEY
DEMO_USER_ID
DEMO_CHAT_ID
Demo Parent
Demo Child
https://n8n.example.com/webhook/kidplanner
CHANGE_ME_LOCALLY
```

---

## 🧪 Before Making Repository Public

Search for:

```text
token
api_key
password
secret
credential
chat_id
user_id
payment_id
webhook
child
parent
.env
postgres
telegram
openai
```

Also manually inspect screenshots before uploading them.

---

## 🧯 If a Secret Was Committed

If a real token, API key, payment secret, or password was committed by mistake:

1. Revoke or rotate it immediately.
2. Replace it locally / in service dashboard.
3. Remove it from repository files.
4. Treat the old secret as compromised.

Do not rely only on deleting the file from GitHub history.
