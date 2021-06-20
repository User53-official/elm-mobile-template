# Elm App Template

The point of this project is to provide an easy way for people to start making single page applications.

Reminder that this uses Elm and JavaScript which means if you know neither, it might be a bad way to start new projects for you. I recommand [reading about Elm](https://guide.elm-lang.org) first.

## To run

To compile the app simply use this command in the folder containing the elm.json file:
elm make src/Pages/* --output=public/app.js

Note: You can change the hierarchy however you'd like when it comes to the public folder, this is just a temporary way of managing things, but it could change in future releases.

Basically:
```
elm make src/Pages/* --output=public/app.js
elm reactor
```
Then go into your browser of choice to localhost:8000/public/index.html

## Important
This project is loosely based on the [Uno Platform](https://platform.uno/)

