# Maintenance

- 2026-08-19: Keep demo reset verification tied to payment state: a fresh portfolio walkthrough should begin with the documented request-limit baseline and no stale synthetic payment references or entitlements.
- 2026-08-20: Confirm daily-tip and AI demo flows consume only the documented synthetic entitlement state so portfolio screenshots remain deterministic and non-sensitive.
- 2026-08-20: Keep portfolio examples free of real child names, birth dates, locations, or family chat history; use synthetic fixtures for all screenshots and sample responses.
- 2026-08-20: Verify the documented request-limit behavior matches the current free/paid demo flow after entitlement or tariff changes.
- 2026-08-20: After schema migrations, reset and seed the demo user once to confirm the documented synthetic baseline can still be recreated without manual database fixes.
- 2026-08-21: Verify a failed synthetic AI request does not decrement the documented demo quota or leave a partially written conversation entry.
- 2026-08-21: Verify resetting the synthetic demo user restores the documented quota counter and clears stale AI conversation state without affecting payment or entitlement fixtures outside that demo user.
- 2026-08-21: Verify the daily-tip demo skips blocked or inactive synthetic users without changing their request quota or creating misleading success records.
- 2026-08-21: Recheck the documented demo reset order after tariff or quota changes so screenshots always begin from the same synthetic entitlement baseline.
