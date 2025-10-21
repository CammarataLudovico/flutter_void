# Project 1.3: Background Color Changer
## Project Description: 
An app with a few colored buttons (e.g., Red, Green, Blue). 
Tapping a button changes the background color of the main screen area to the corresponding color, teaching how state can affect widget properties like color.
## Core Technical Requirements:
- Use a StatefulWidget to manage the current background Color.
- Layout widgets like Column and Row to arrange buttons.
- Multiple ElevatedButton widgets, each with a specific color.
- A Container widget that wraps the content and whose color property is bound to the state variable.
## Bonus: add more functionalities
- Instead of buttons, use a single Switch widget.
- When the switch is ON, the background is yellow (for "light mode")
- When OFF, it's dark grey (for "dark mode")
- Add a “randomizer” that picks a random color and applies it to the widget
- tip: use dart:math and Random()
- tip 2: use Colors.values to access all possible colors
