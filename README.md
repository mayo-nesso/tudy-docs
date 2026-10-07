# tudy-docs

Public legal pages for the Tudy app, served by GitHub Pages. Static HTML, one file per page, no build step.
Model: `gracias-docs`. Spec: `docs/10_features/2026_10_07_legal_docs_site.md` in the `tudy-mobile` repo.

| Page | Path |
|---|---|
| Privacy policy | `legal/privacy.html` |
| Terms of use | `legal/terms.html` |
| Support | `legal/support.html` |
| Delete account | `legal/delete-account.html` |

Spanish only for now. English versions would go next to them with an `-en` suffix.

**The texts are a draft, not legal advice.** A lawyer reviews them before public launch (`tudy-mobile` `docs/PLAN.md`,
decision 21).

## Check

`./check.sh` fails on a broken internal link and lists the open `<mark>` placeholders.
`./check.sh --launch` also fails while any placeholder is open: run it before public launch.

## Versions

The privacy policy and the terms state a version, `2026-10-beta-1`, equal to `kConsentVersion` in the app. When a
change matters (a new provider, a new kind of data), bump both together.

## Open before launch

| Item | Where |
|---|---|
| Sentry region and retention | `privacy.html` sections 3 and 5 (chosen when the Sentry organisation is created, `tudy-mobile` PLAN decision 30) |
| Subscription terms (Phase 5.3) | `terms.html` section 5 |
| In-app deletion (Phase 5.2) replaces the email-only path | `delete-account.html` |
| Contact email is a personal placeholder; use a Tudy-only address for the beta and one on Tudy's own domain for launch | all four pages |
| Payments (RevenueCat, store receipts) add a recipient and a data type: update the privacy policy and bump the version | `privacy.html` |
| Vendor claims marked [F] in the PRIV-3 record are re-read on the vendor's page | `privacy.html` section 5 |
| Lawyer review: Gemini's under-18 clause, the classifier's undefined retention, transfers abroad, whether one tick covers consent | whole site |

## Where each statement comes from (`tudy-mobile`)

| Policy statement | Source |
|---|---|
| Adult-only app, no child account, one tick consent | `docs/10_features/2026_10_06_consent_screen.md`, ARB `consent*` |
| Child nickname and grade stored; nickname never sent to the AI | ARB `privacySummary*`, `app/test/features/child/presentation/child_privacy_test.dart` |
| Free text up to 400 characters, kept 12 months, then purged | `docs/PLAN.md` Open points (retention), migration `purge_session_input_text`; the scheduler is Phase 5.2 |
| Personal-data scrub before any provider call, with limits | `docs/PLAN.md` decision 31 |
| Supabase in São Paulo | `docs/PLAN.md` decision 30 (1) |
| Anthropic: no training, 30-day deletion, global inference | `docs/05_discovery/2026_09_26_priv3_provider_terms.md` (c), decision 30 (4) |
| Gemini: Paid Services only, 55-day abuse logs, any country | same record, decision 30 (2) |
| Classifier: US, retention undefined | same record, decision 30 (3) |
| Technical logs hold no text and outlive deletion unlinked | `supabase/migrations/20260926072546_generation_log.sql` |
| No analytics, error reports only after consent | `docs/PLAN.md` decision 21, `docs/00_phases/phase_5.md` 5.4 |
| Deleting an account does not cancel a store subscription | `docs/00_phases/phase_5.md` 5.2 |
