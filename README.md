## WhatsApp API

This is the API for the [WhatsApp clone](https://github.com/Mallig/whatsapp) created in React.

Using Ruby and Sinatra to create a RESTful API. To begin with this API will not be connected with a database, all information being served to the React app will be stored local to the API. 

### Routes

| Route | Method | Purpose |
|-------|--------|---------|
| User  |  GET   | retrieve user details
| " "   |  POST  | create user |
| user/conversations| GET | list of conversations |
| user/conversations/1 | GET | single conversation |
| message | POST | create a message |