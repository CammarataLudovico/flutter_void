# Project 3.2: A Better Color changer

### Project Description: 

- This project is identical to the 1.3 track. 
- But, this time, Handle it with Riverpod! Write a simple app with a home page and a settings page. They can be “dummy” pages, with nothing really meaningful in it. The settings page, though, contains a Switch to toggle dark/light mode. This change must be applied to the entire app instantly, which is managed by Riverpod.
- Core Technical Requirements:
- Use go_router for the /home and /settings routes
- Use a Notifier to manage the app's current Brightness

### Suggestion: 

- The /settings screen must watch the provider to set the Switch value and call the provider to update the theme when the switch is toggled.

### Bonus: moar functions1!!1!

- Just like track 1.3, allow the user to customize their app using a color switcher, which must be reflected instantly on the whole application
- Use radio buttons to pick and choose different “base” colors, e.g.:
    - Colors.blue
    - Colors.green
    - Colors.purple
    - (you can pick any primary color you want, and how many you want)
- Add an extra ElevatedButton to randomize the color!