== API USAGE

url: https://geniussports.herokuapp.com

# Create User

### /users POST

###### Mandatory Params
* user: {email: email, password: password}

###### Optional Params
* user: {name: name, phone_number: phone_number}
```
{
  "user": {
    "id": 8,
    "email": "jerry@springer.com",
    "authentication_token": "SCGFkkMzasfxu-tFixBb",
    "phone_number": "5554443332",
    "name": "Jerry Springer"
  }
}
```
# Edit User

### /users PUT

###### Optional Params
* user: {name: name, phone_number: phone_number, email: email}
```
{
    "user": {
        "id": 6,
        "email": "real@fake.com",
        "authentication_token": "jfShNZeZaTK2QMC757us",
        "phone_number": "555-555-5555",
        "name": "Bob"
    }
}
```

# Sign In User

### /users/sign_in POST

###### Mandatory Params
* user: {email: email, password: password}
```
{
    "user": {
        "id": 2,
        "email": "devito@gmail.com",
        "authentication_token": "wbwFz4DjZZEAzWg5QsEf"
        "phone_number": "7705554040",
        "name": "Macho Man Alan Matthews"
    },
    "teams": [
        {
            "id": 2,
            "name": "Crazy Crazy Cats",
            "created_at": "2015-03-07T21:40:45.880Z",
            "updated_at": "2015-03-07T21:40:45.880Z"
            "sport": "Underwater Basket Weaving"
        }
    ]
}
```

# Update Password

### /users/password PUT

###### Mandatory Params
* auth_token
* user: {password: newpassword}
```
{
    "user": {
        "id": 2,
        "email": "devito@gmail.com",
        "authentication_token": "wbwFz4DjZZEAzWg5QsEf"
        "phone_number": "7705554040",
        "name": "Macho Man Alan Matthews"
    },
    "teams": [
        {
            "id": 2,
            "name": "Crazy Crazy Cats",
            "created_at": "2015-03-07T21:40:45.880Z",
            "updated_at": "2015-03-07T21:40:45.880Z"
            "sport": "Underwater Basket Weaving"
        }
    ]
}

```

# Create Team

### /teams POST

###### Mandatory Params
* auth_token
* team: {name: name}

###### Optional Params
* team: {sport: sport}
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
    "sport": null
  },
  "coaches": [
    {
      "id": 1,
      "name": "Macho Man Alan Matthews",
      "phone_number": "7705554040",
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
# Edit Team

### /teams/:id PUT

###### Mandatory Params
* auth_token: logged_in_user's token

###### Optional Params
* invites: [[email, player_name], [email, player_name], [email, player_name]]
* player_id: player_id (Drops this player from the team)

###### Returns same as Show Team above

# Show Player

### /players/:id GET

###### Mandatory Params
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

###### Mandatory Params (Must be a Parent)
* auth_token: logged_in_user's token
* player: {name: name, medical_name: doctor/office, medical_number: phone#, medical_info: "additional notes about their medical information such as allergies or conditions" }
* relationship: relationship

If auth_token belongs to a parent, returns same as Show Player above.

# Create Game

### /games POST

###### Mandatory Params
* auth_token
* game: {team_id: team_id}

###### Optional Params
* game: {location: location, date: date, time: time, opponent: opponent}


```
{
    "game": {
        "id": 15,
        "location": "Selhurst Park",
        "date": null,
        "time": null,
        "opponent": null,
        "created_at": "2015-03-08T15:24:49.212Z",
        "updated_at": "2015-03-08T15:24:49.212Z",
        "team_id": 2
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
##### Mandatory Params
* auth_token

```
{
    "game": "Game was deleted"
}

```
# Edit Game

### /games/game_id EDIT

##### Mandatory Params
* auth_token

##### Optional Params
* game: {date: date, location: location, time: time, opponent: opponent}

```
{
    "game": {
        "id": 15,
        "location": "Selhurst Park",
        "date": "03-15-2015",
        "time": "9:00AM",
        "opponent": "Crystal Palace",
        "created_at": "2015-03-08T15:24:49.212Z",
        "updated_at": "2015-03-08T15:29:36.775Z",
        "team_id": 2
    }
}

```
