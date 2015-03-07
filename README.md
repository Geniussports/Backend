== API USAGE

url: https://geniussports.herokuapp.com

# Create User

### /users POST

* user: {email: email, password: password}
```
{
    "user": {
        "email": "test1@nowhere.com",
        "auth_token": "FtH4ENxd9-H_TuNo89YP"
    }
}
```

# Sign In User

### /users/sign_in POST

* user: {email: email, password: password}
```
{
    "user": {
        "email": "test1@nowhere.com",
        "auth_token": "FtH4ENxd9-H_TuNo89YP"
    }
}
```