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

# Show Player

### /players/:id GET

* auth_token: logged_in_user's token
* player: {name: name, medical_name:  }
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
    }
}
```

# Edit Player

### /players/:id PUT

* auth_token: logged_in_user's token
* player: {name: name, medical_name: doctor/office, medical_number: phone#, medical_info: "additional notes about their medical information such as allergies or conditions" }

If auth_token belongs to a parent:

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
    }
}
```
