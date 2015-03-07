== API USAGE

url: https://geniussports.herokuapp.com

# Create User

### /users POST

* user: {email: email, password: password}
```
{
  "user": {
      "id": 2,
      "email": "c@c.com",
      "authentication_token": "Y5zT6jysg_ssc-hppsW_"
}
}
```

# Sign In User

### /users/sign_in POST

* user: {email: email, password: password}
```
{
  "user": {
    "id": 1,
    "email": "b@b.com",
    "authentication_token": "hR2yA4a7WWzN6JGScYhf"
}
}
```
