# Project 3.3: Login and Profile

### Project Description: 
- An app with two screens: 
    - a “Home" screen, 
    - the “Login” screen and a "Profile" screen. 
    
- The "Home" screen greets the user with "Welcome, Guest!". This means we’re initially unauthenticated. 
- The "Login" screen provides a reactive_form that allows a user to fake login (as long as the user inputs a valid email and a non-empty password). 
- When logged in, the "Home" screen must automatically update to show the default username. 
- Then, the screen “Profile” allows the user to edit its username. When saved, the "Home" screen must automatically update to show the new username.

### Core Technical Requirements:

- Use go_router for the /home and /profile routes

- Define a simple Auth model (e.g., with an email property)
- Define a User object that has two props:
    - email
    - username (defaults with the inputted email)

- Use a Notifier to manage the authentication state of the current User object
- The "Home" screen watches the provider to display user.username
- The "Profile" screen reads the provider to pre-fill the form and calls a method on the notifier (e.g., updateName(String newName)) to save the changes.

### Bonus: implement moar stuff

- Add a ReactiveTextField for "Email" in the Profile page, so that we can change it:
- we need the change to be “confirmed” by two identical fields (the classic “change email” validation that requires the user to input it two times in two adjacent fields)
- exploit reactive_forms to validate the email Validators.email so that the two fields are identical
- extra bonus: disable the "Save" button if the email is invalid or if the two inputted emails are different!

