[*] Add user.id to the already existing JSON returns for user create/edit
[*] /teams POST (create a team and automatically become manager)
[*] /team/:id GET (displays team information)
[ ] /teams/:id PUT (change information about the team)
      (manager, coach, player ids and names, parents can wait for a click on a player)
      invite: [[email, player name], [email, player name]]
      remove: player_id
      Invite needs to check for existing email addresses and if they exist, check that user's players for equivalent name (checking via .downcase on both)
      Need some sort of way to modify the schedule as well, but that would probably be a different page.
[#] /player/:id GET (displays player information)
      (medical info, parents and parents' relationships, email and number)
[ ] /players POST (create a player with parent and team)
[*] /players PUT (parents can edit player)
[ ] add a new Game model which has location, date, time, opponent.
    Games belong_to a team, teams have many games
[ ] add an "invite_accepted" boolean to Roles
[ ] add phone number column to Users

Thoughts:
When a coach sends out invites, he sends email and player name. Player name should be put in roster regardless of whether the parent has accepted, so a "player" will be created at that point. But when a parent processes their invite, they should be given the option

Something like this:

Johann Appleseed has been invited to play in the Orchard All Stars.
Is this your child?

Yes, create profile
Yes, but has existing profile (link to list of parent's children to choose from)
No, why are you sending me this crappy email and why am I crazy enough to have made an account just to say no to this?

So, we'll need to create a blank player with the name on back end when the invitation is created and then when the invitation is processed, we'll need front end to send us information on whether that child's name was accepted as is or not and we will add info to the newly created player or delete it accordingly.

Just wanted to throw this out in case anyone has different thoughts.
