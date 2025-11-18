# Project 2.2: Recipe Book

### Project Description

An app that displays a list of recipes. Tapping on a recipe name navigates the user to a detail page that shows the ingredients and instructions for that recipe. Note: all recipes have an external link a user can paste.

### Core Technical Requirements

- Create a custom data model class (e.g., Recipe) to hold recipe information (title, ingredients, steps).
- Use a ListView to display the list of recipe titles on the home screen.
- Implement multi-screen navigation (showDialog) where the selected Recipe object is passed to the detail screen.
- Display structured data on the detail screen (title, ingredients, steps)

### NOTE

- build a dummy list of recipes to start with
no one is asking you to build a “add” form for this

### Bonus: implement more functionalities

- On the recipe detail page, add a button that uses the url_launcher package to search for the recipe name on Google.

- this means we need to add a url field to Recipe, to the form, and an IconButton on the trailing slot of ListTile that allows us to open that external link!
