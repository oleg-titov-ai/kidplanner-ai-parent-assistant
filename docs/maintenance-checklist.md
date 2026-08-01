# Maintenance checklist

Before portfolio demos, verify payment idempotency, request-limit accuracy, daily-tip delivery, and removal of real family or child data.

Review message-history retention and deletion behavior before connecting a new production database.

Use synthetic profiles when testing exports, screenshots, and support logs so no real family details enter repository history.

Confirm expired plans cannot consume paid-request balances after the billing period ends.

Test request-limit resets at the configured billing boundary to prevent early or delayed quota renewal.

Restore a recent synthetic backup in a disposable environment periodically to confirm migrations and recovery instructions still work.

Run one synthetic account-deletion test and confirm related conversation data is removed or anonymized according to the documented retention policy.

Run a fixed set of synthetic prompts after model or prompt updates to catch unexpected changes in tone, formatting, and actionability.

Inspect one test export to confirm child names, birthdays, and message text are omitted or replaced with synthetic values.

Review committed test fixtures periodically to confirm every profile and conversation remains fully synthetic.

Verify a failed payment callback cannot increment balances or extend a synthetic test subscription.

Confirm support logs use synthetic user identifiers and never include full prompt or conversation content by default.