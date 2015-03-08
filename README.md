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
        "id": 2,
        "email": "devito@gmail.com",
        "authentication_token": "wbwFz4DjZZEAzWg5QsEf"
    },
    "teams": [
        {
            "id": 2,
            "name": "Crazy Crazy Cats",
            "created_at": "2015-03-07T21:40:45.880Z",
            "updated_at": "2015-03-07T21:40:45.880Z"
        }
    ]
}
```

# Update Password

### /users/password PUT

* auth_token
* user: {password: newpassword}
```
{
    "user": {
        "id": 2,
        "email": "devito@gmail.com",
        "authentication_token": "wbwFz4DjZZEAzWg5QsEf"
    },
    "teams": [
        {
            "id": 2,
            "name": "Crazy Crazy Cats",
            "created_at": "2015-03-07T21:40:45.880Z",
            "updated_at": "2015-03-07T21:40:45.880Z"
        }
    ]
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
    "sport": "dogfighting"
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
    "updated_at": "2015-03-07T16:05:37.332Z",
    "sport": "dogfighting"
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
      "id": 5,
      "name": "Crum"
    }
  ],
  "games": [
    {
      "id": 2,
      "location": "GA",
      "date": "march",
      "time": "sure",
      "opponent": "cows",
      "team_id": 4
    },
    {
    "id": 3,
    "location": "Augusta, GA",
    "date": "March 27, 2015",
    "time": "7:00 PM",
    "opponent": "Fighting Vultures",
    "team_id": 4
    }
  ]
}
```
# Show Player

### /players/:id GET

* auth_token: logged_in_user's token

```
{
    "player": {
        "id": 1,
        "name": "Terry Morgan",
        "medical_name": "Doctor Spaceman",
        "medical_number": "123-456-7890",
        "medical_info": "He thinks he's allergic to broccoli, but I say give it to him anyway.",
        "created_at": "2015-03-07T15:30:52.108Z",
        "updated_at": "2015-03-07T16:30:39.189Z"
    },
    "family": [
        {
            "user": {
                "id": 2,
                "email": "devito@gmail.com"
            },
            "relationship": null
        }
    ]
}
```

# Edit Player

### /players/:id PUT

* auth_token: logged_in_user's token
* player: {name: name, medical_name: doctor/office, medical_number: phone#, medical_info: "additional notes about their medical information such as allergies or conditions" }

If auth_token belongs to a parent, returns same as Show Player above.

# Create Game

### /games POST
###### location required; can optionally pass in date, time, opponent

* auth_token
* game: {location: location}
```
{
    "game": {
        "id": 11,
        "location": "Anfield",
        "date": null,
        "time": null,
        "opponent": null,
        "created_at": "2015-03-08T02:38:44.629Z",
        "updated_at": "2015-03-08T02:38:44.629Z"
    }
}

```

# Show Game

### /games GET

```
{
    "game": {
        "id": 11,
        "location": "Anfield",
        "date": null,
        "time": null,
        "opponent": null,
        "created_at": "2015-03-08T02:38:44.629Z",
        "updated_at": "2015-03-08T02:38:44.629Z"
    }
}

```

# Delete Game

### /games/:id DELETE

```
{
    "game": "Game was deleted"
}

```


