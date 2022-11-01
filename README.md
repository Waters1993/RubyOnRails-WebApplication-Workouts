# Workouts App built using Ruby on Rails
See live: https://myworkoutbuilder.herokuapp.com/
## TODO
- Add url to README
- Complete Testing Suite
- Create a test account feature

## Table of Contents
- [RoR Workouts App](#ror-workouts-app)
  - [TODO](#todo)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
    - [Built With](#built-with)
    - [Developer tools](#developer-tools)
  - [Features](#features)
    - [Attempts](#attempts)
    - [Random](#random)
  - [Contact](#contact)
  - [Acknowledgements](#acknowledgements)
  - [](#)
- [README](#readme)

## Overview
![screenshot](https://github.com/Waters1993/Rails_App/blob/main/app/assets/images/readme.JPG?raw=true)

Ruby on Rails web application used to create and save workouts. Workouts have simple CRUD functionality utilizting RESTful architecture. Live website can be viewed here. <br/>
https://still-sierra-24550.herokuapp.com/

<!-- TODO: Add a screenshot of the live project.
    1. Link to a 'live demo.'
    2. Describe your overall experience in a couple of sentences.
    3. List a few specific technical things that you learned or improved on.
    4. Share any other tips or guidance for others attempting this or something similar.
 -->

### Built With
- Ruby 3.1.2
- Rails 7.0.3.1

### Developer tools
- Visual Studio Code
- Heruko 7.53.0


<!-- TODO: List any MAJOR libraries/frameworks (e.g. React, Tailwind) with links to their homepages. -->

## Features
### Attempts
Each workout has many associated 'attempts'. Attempts allow a user to record the time taking to complete a workout. Attempts are then displayed in a leader board. 
Active record Query automatically updates the leader board to show the fastest time to compelte the workout. 

### Random
The random button in the nav bar displays a random workout from workouts you have previously created. 
