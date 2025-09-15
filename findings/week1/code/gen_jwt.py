import jwt, datetime

secret = "mysecret"

payload = {
    "sub": "1234567890",
    "name": "Lab User",
    "role": "tester",
    "iat": datetime.datetime.now(datetime.timezone.utc),
    # "exp": datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(minutes=15),
    "aud": "myapi"
}

token = jwt.encode(payload, secret, algorithm="HS256")
print(token)