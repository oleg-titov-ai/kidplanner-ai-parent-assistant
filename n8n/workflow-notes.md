# ⚙️ n8n Workflow Notes

This document describes the recommended n8n workflow structure for KidPlanner.

Do not publish production n8n exports with credentials, webhook IDs, real URLs, or internal instance metadata.

---

## 🤖 Telegram AI Assistant Branch

Recommended node order:

```text
Telegram Trigger
Normalize Telegram Message
PostgreSQL: Upsert User
PostgreSQL: Check Request Limit
IF: Has Available Requests
OpenAI: Generate Answer
PostgreSQL: Save User Message
PostgreSQL: Save Assistant Answer
PostgreSQL: Increment Request Counter
Telegram: Send AI Answer
IF: Limit Reached
Telegram: Send Limit Message
Telegram: Send Payment Offer
```

---

## 💳 Payment Webhook Branch

Recommended node order:

```text
Webhook: Payment Provider Event
Normalize Payment Event
IF: Payment Succeeded
PostgreSQL: Save Payment
PostgreSQL: Add Extra Requests
Telegram: Notify User About Successful Payment
Respond to Webhook
```

---

## 🌅 Daily Tips Branch

Recommended node order:

```text
Schedule Trigger
PostgreSQL: Select Active Users
PostgreSQL: Select Daily Tip
Telegram: Send Daily Tip
PostgreSQL: Update last_sent_at
```

---

## 🧠 Example Telegram Message Normalization

```javascript
const msg = $json.message || {};
const from = msg.from || {};
const chat = msg.chat || {};

return {
  json: {
    telegram_user_id: String(from.id || 'DEMO_USER_ID'),
    telegram_chat_id: String(chat.id || 'DEMO_CHAT_ID'),
    username: from.username || null,
    first_name: from.first_name || null,
    last_name: from.last_name || null,
    message_text: msg.text || '',
    message_date: msg.date || null
  }
};
```

---

## 🔐 Public Demo Rules

Before publishing any n8n export:

- remove credentials;
- remove webhook IDs;
- remove production URLs;
- remove real Telegram IDs;
- remove real OpenAI credentials;
- remove payment provider credentials;
- remove server IPs;
- remove internal execution data.

Use `n8n/workflow-placeholder.json` as a safe public placeholder.
