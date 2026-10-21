# 1MIGRATION → EVOLUSA: conversion correction

## Implemented

- Separate member discovery and professional application links, both with `ref=1migration`.
- Professional proposition: marketing tools, CRM/contact follow-up, creative work and content planning. Availability must be confirmed before purchase.
- Explicit separation of Laura's services from tools; no income guarantee, ranking advantage or automatic professional approval.
- No contact fields, immigration answers, referrers or page queries passed to EVOLUSA or the contact receiver.
- Receipt contract: a receiver must return successful HTTP status and JSON `{ "accepted": true }` only after durable acceptance. No configured receiver, errors, malformed receipts and timeouts show the WhatsApp manual-send state.
- Resource links open directly; removed newsletter success without a receiver.

## Validation

`node --test tests/contact.test.cjs`: 9 passing tests. `node --check app.js`, `node --check lead-delivery.js`, `git diff --check` pass.

Browser rendering and full interaction not verified in this execution: required managed preview browser skill unavailable. No receiver was connected, no external message sent, no payment enabled.

## Still required before publication

1. Review the existing services, ratings, response-time promises and geographic claims with Laura. The legacy homepage still contains claims outside this bounded change.
2. Publish only an allowlisted static package (`index.html`, `styles.css`, `app.js`, `lead-delivery.js`, `assets/`). The repository root contains unrelated historical documents; do not deploy that entire root as a public file server.
3. Complete receiver + storage ownership/access/consent review if CRM intake is desired. Until then, visitors must send the prepared WhatsApp message themselves.
4. Implement and test EVOLUSA referral persistence through member signup and professional applications. A URL parameter alone is not confirmed attribution storage or a commission agreement.
5. Remove unverified legacy claims from EVOLUSA's `/professional-invite`; that separate repository had an active implementation lease and was not edited here.

No share of immigration-service fees or automatic regulated-service activation is implemented. Membership pricing, merchant entity and payment collection remain separate decisions.
