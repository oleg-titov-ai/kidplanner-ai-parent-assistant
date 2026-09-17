# Next Actions

Small practical improvements to consider next.

## Short Term

- Link product documentation from the README.
- Add a demo parent journey.
- Add safe sample messages.
- Clarify that portfolio previews never consume request limits.
- Document the read-only preview invariant: no quota, cache, schedule, billing, or audit-state writes.
- Add a regression test proving cancelled previews leave zero writes in demo-scoped stores.
- Add a database-level assertion that preview transactions remain read-only for their full lifetime.

## Medium Term

- Add tests for request counting.
- Add notes for payment validation.
- Add unsubscribe flow notes.
- Add delivery monitoring notes.

## Portfolio

- Keep privacy notes visible.
- Show the business value clearly.
