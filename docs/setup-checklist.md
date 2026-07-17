# ✅ Setup Checklist

Use this checklist to deploy a demo or production version of KidPlanner.

---

## 1. Telegram Bot

- [ ] Create a Telegram bot using BotFather.
- [ ] Store the bot token locally or in n8n credentials.
- [ ] Do not commit the bot token to GitHub.
- [ ] Set bot commands such as `/start`, `/help`, `/limit`, `/pay`.

---

## 2. PostgreSQL

- [ ] Create PostgreSQL database.
- [ ] Run `sql/001_schema.sql`.
- [ ] Run `sql/002_demo_data.sql`.
- [ ] Check demo user and tariff data.
- [ ] Define and document a retention period for stored conversation history.
- [ ] Verify stored conversation history can be deleted for a test user without affecting other records.
- [ ] Verify demo data can be reset without affecting production records.
- [ ] Confirm a second demo reset produces the same clean baseline state.
- [ ] Confirm demo fixtures use identifiers that cannot collide with production users or payments.

---

## 3. n8n

- [ ] Create Telegram credentials in n8n.
- [ ] Create PostgreSQL credentials in n8n.
- [ ] Create OpenAI credentials in n8n.
- [ ] Create Telegram Trigger workflow branch.
- [ ] Create payment webhook branch.
- [ ] Create daily tips scheduled branch.
- [ ] Test AI response flow.
- [ ] Verify a clear fallback message is sent when the AI request times out.
- [ ] Verify provider rate limits return a safe user-facing fallback.
- [ ] Review system prompts for medical, legal, and emergency escalation wording.
- [ ] Confirm workflow error logs redact user messages and payment identifiers.
- [ ] Use anonymized, fictional parent and child details in demo prompts and screenshots.
- [ ] Test limit handling.
- [ ] Test payment success handling.
- [ ] Test duplicate payment event handling.
- [ ] Confirm payment status and request balance stay consistent after retries.
- [ ] Confirm payment-limit changes leave a non-sensitive audit record for troubleshooting.
- [ ] Verify payment status and request-limit updates commit atomically in one database transaction.
- [ ] Test daily tip delivery.

---

## 4. Payment Provider

- [ ] Create demo payment product.
- [ ] Configure payment webhook URL.
- [ ] Store provider secret locally or in n8n credentials.
- [ ] Verify payment webhook signatures before processing events.
- [ ] Reject replayed webhook events that reuse an already processed event ID.
- [ ] Confirm the paid amount and currency match the expected product before increasing limits.
- [ ] Test successful payment event.
- [ ] Test failed payment event.
- [ ] Verify retrying a failed payment event cannot grant requests twice.

---

## 5. Security Check

- [ ] Search repository for tokens.
- [ ] Search repository for API keys.
- [ ] Search repository for real user IDs.
- [ ] Search repository for real chat IDs.
- [ ] Search repository for real child names.
- [ ] Search repository for real payment IDs.
- [ ] Search repository for private webhook URLs.

---

## 6. Demo Screenshots

- [ ] Telegram start screen.
- [ ] Parent question example.
- [ ] AI answer example.
- [ ] Request limit message.
- [ ] Payment offer.
- [ ] Payment success.
- [ ] n8n workflow overview.
- [ ] PostgreSQL demo tables.