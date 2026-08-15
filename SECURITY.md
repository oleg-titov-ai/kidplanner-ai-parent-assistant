# Security Policy

## Scope

KidPlanner AI Parent Assistant is a public portfolio project. Public files must use demo values and placeholders only.

## Sensitive Data That Must Not Be Committed

- Telegram bot tokens;
- OpenAI API keys;
- payment provider credentials;
- YooKassa shop IDs and secret keys;
- PostgreSQL passwords;
- n8n credentials;
- production webhook URLs;
- real chat IDs;
- real user IDs;
- private parent messages;
- child names or family details;
- `.env` files with real values.

## Safe Public Examples

Use demo users, fake messages, placeholder payment data, and example configuration only. Screenshots should not expose private Telegram chats, payment screens, or family data.

## Reporting a Security Issue

Open a GitHub issue with a safe description only. Do not include tokens, API keys, private messages, webhook URLs, payment credentials, or database credentials.

## Privacy Notes

A production version should collect the minimum required user data, clearly explain data handling, and provide a way for users to stop messages or remove stored data.

Before publishing AI examples, confirm prompts and responses contain only synthetic family details and no real payment references.
