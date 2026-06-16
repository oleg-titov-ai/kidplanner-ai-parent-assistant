# 🧩 Architecture

KidPlanner has three main automation flows:

1. Telegram AI assistant flow
2. Payment / limit extension flow
3. Daily parenting tips flow

---

## 🤖 Telegram AI Assistant Flow

```text
Parent sends message in Telegram
        ↓
Telegram Bot
        ↓
n8n Telegram Trigger
        ↓
Normalize message
        ↓
Check user profile and request limits in PostgreSQL
        ↓
If limit is available: send request to OpenAI
        ↓
Save question and answer in PostgreSQL
        ↓
Reply to parent in Telegram
```

---

## 💳 Payment Flow

```text
Parent requests extra messages
        ↓
Bot sends payment link or payment button
        ↓
Payment provider processes payment
        ↓
Payment webhook calls n8n
        ↓
n8n validates payment event
        ↓
PostgreSQL updates user request balance
        ↓
Bot notifies parent in Telegram
```

---

## 🌅 Daily Tips Flow

```text
n8n Schedule Trigger
        ↓
Select active users from PostgreSQL
        ↓
Generate or select parenting tip
        ↓
Send daily tip to Telegram user
        ↓
Update last_sent_at in PostgreSQL
```

---

## 🗄️ PostgreSQL Role

PostgreSQL stores:

- user profiles;
- tariff / request limit data;
- message history;
- payment records;
- daily tip delivery state.

---

## 🔐 Security Model

Production secrets must be stored only in local environment variables or n8n credentials.

Never publish:

- Telegram bot tokens;
- OpenAI API keys;
- payment provider secret keys;
- real chat IDs;
- real user messages;
- real child names;
- private webhook URLs.
