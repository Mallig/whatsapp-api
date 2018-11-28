## WhatsApp API

This is the API for the [WhatsApp clone](https://github.com/Mallig/whatsapp) created in React.

Using Ruby and Sinatra to create a RESTful API. The API connects to a postgres database using a home made ORM.

### Routes

| Route | Method | Purpose |
|-------|--------|---------|
| User  |  GET   | retrieve user details
| " "   |  POST  | create user |
| user/conversations| GET | list of conversations |
| user/conversations/1 | GET | single conversation |
| message | POST | create a message |