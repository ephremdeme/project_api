# project_api

our data source api

When signing up or logging in the server will send `accessToken` and `refreshToken` responses to be used as a headers later:

```
{
"x-access-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozfSwiaWF0IjoxNjAyODU1OTQxLCJleHAiOjE2MDM3NTU5NDF9.BoI6vn_dMSOEgKAcbfHfPXH35TabI-\_RDwjOHTXC2UY",
"x-refresh-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozLCJjb3VudCI6MH0sImlhdCI6MTYwMjg1NTk0MSwiZXhwIjoyMjA3NjU1OTQxfQ.xZNJdZ6iK8w4TneG_rldcmAPlEEaNNEeABg9bsurRRs"
}
```

These headers can be used to authenticate users by sending these data in the headers.
