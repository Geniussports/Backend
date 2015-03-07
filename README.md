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

# Create Team

### /teams POST

* auth_token
* team: {name: name}
```
{
  "team": {
    "id": 4,
    "name": "dogs",
    "created_at": "2015-03-07T16:05:37.332Z",
    "updated_at": "2015-03-07T16:05:37.332Z"
}
}

```

# Show Team

### /teams/:id

```
{
  "team": {
    "id": 4,
    "name": "dogs",
    "created_at": "2015-03-07T16:05:37.332Z",
    "updated_at": "2015-03-07T16:05:37.332Z"
},
  "coaches": [
    {
      "id": 1,
      "email": "b@b.com",
      "role": "manager"
    }
    ],
  "players": [
    {
      "id": 1,
      "name": "Angus McCreary"
      },
    {
      "id": 2,
      "name": "Butts McGee"
    }
  ]
}
