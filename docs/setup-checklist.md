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
- [ ] Confirm demo and production database connection strings cannot be confused by shared environment variable names.

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
- [ ] Confirm a failed daily-tip send does not mark the user as successfully delivered.
- [ ] Confirm demo AI failures can be diagnosed from metadata-only logs without storing the parent prompt or generated answer.

---

## 4. Payment Provider

- [ ] Create demo payment product.
- [ ] Configure payment webhook URL.
- [ ] Store provider secret locally or in n8n credentials.
- [ ] Verify payment webhook signatures before processing events.
- [ ] Confirm an invalid webhook signature returns an error without changing payment or request-limit state.
- [ ] Confirm webhook events originate from the configured provider endpoint or verified source range.
- [ ] Reject unsupported webhook event types before changing user limits.
- [ ] Reject replayed webhook events that reuse an already processed event ID.
- [ ] Confirm webhook event timestamps are within an accepted age window before processing.
- [ ] Confirm out-of-order payment events cannot roll a final status back to an earlier state.
- [ ] Confirm the paid amount and currency match the expected product before increasing limits.
- [ ] Confirm currency amounts are compared using integer minor units rather than floating-point values.
- [ ] Confirm each provider product ID maps to exactly one internal tariff or request package.
- [ ] Store only the payment metadata required for reconciliation and support.
- [ ] Define a retention period for non-sensitive payment audit metadata.
- [ ] Verify payment creation uses a stable idempotency key so retries cannot create duplicate charges.
- [ ] Reconcile a completed demo payment against the provider record before closing the test.
- [ ] Verify user-facing payment messages display the same currency configured for the product.
- [ ] Confirm the payment receipt summary matches the provider-approved amount and currency.
- [ ] Validate the webhook payload against the documented schema version before processing.
- [ ] After a provider API timeout, query payment status before retrying creation or granting requests.
- [ ] Confirm every stored provider payment reference is unique before granting request credits.
- [ ] Confirm the payment customer reference belongs to the user receiving request credits.
- [ ] Reconcile granted request credits with the approved payment package after webhook processing.
- [ ] Confirm every supported currency uses the correct number of minor-unit decimal places.
- [ ] Confirm expired or cancelled payment sessions cannot grant request credits.
- [ ] Confirm the user’s final request balance equals the prior balance plus the granted package after a successful payment.
- [ ] Confirm the payment audit record shows the previous balance, granted package, and resulting balance without storing private conversation data.
- [ ] Confirm expired payment audit records can be removed without changing user balances or entitlements.
- [ ] Confirm the active entitlement total can be reconciled from immutable payment audit records after a restore test.
- [ ] Confirm entitlement reconciliation reports exclude user message content and provider secrets.
- [ ] Confirm a database restore preserves the one-to-one mapping between processed payment IDs and granted request packages.
- [ ] Test successful payment event.
- [ ] Test failed payment event.
- [ ] Verify retrying a failed payment event cannot grant requests twice.
- [ ] Reconcile the demo user's final request balance after the full payment test sequence before recording portfolio screenshots.
- [ ] Confirm resetting the demo user also clears synthetic entitlement state so a new payment walkthrough starts from a known baseline.
- [ ] Confirm the first synthetic payment after a demo reset grants exactly the documented package and no residual credits remain.
- [ ] Confirm the post-reset payment audit contains only the new synthetic transaction and no stale references from the previous walkthrough.

---

## 5. Security Check

- [ ] Search repository for tokens.
- [ ] Search repository for API keys.
- [ ] Search repository for real user IDs.
- [ ] Search repository for real chat IDs.
- [ ] Search repository for real child names.
- [ ] Search repository for real payment IDs.
- [ ] Search repository for private webhook URLs.
- [ ] Confirm demo screenshots contain no notification banners with personal data.

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
- [ ] Recheck screenshots at full resolution for names, IDs, tokens, and notification previews before publishing.
- [ ] Use synthetic timestamps in demo screenshots when real activity times are not relevant to the portfolio example.