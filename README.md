# KivuShot
Discover all the beautiful places of the Kivu

## General Functionalities

* A map to show all places in kivu
* Ability to scroll though places from:
    - a list (showing basic info of places: image, name, location)
    - a horizontal scroll view (dipslayed on top of the map)
* The map is zoomed based on **user's location** with a fallback to **median location** of places (here, we could use an advanced algorithm)
* Places are sorted based on **upvote** or **user's location** (Filtering options) 
* Places should have categories (hotels, restaurants, etc)

## Authenticated Users Functionalities

* Ability to authenticate and add basic info
    - email
    - password
    - username
    - location
    - picture
    - interests (Things they'd like to be notified about [food, drinks, hotels, restaurants, parks, etc])
    - etc
* Ability to upvote (like) a place
* Ability to share a place (outside the app)
* Ability to add a picture from a place
* Ability to suggest a place

## Places Specific Requirements
A place should:

- A place should have a owner (the one who created it): This can be either the main app or a contributor
- have only one main low quality picture ** (under ~ 100 Kb)** to allow fast loading and use as thumbnail

- A place should have at least 1 high quality image to use for better representation
- A place should have at most 10 pictures considering high quality picture


# Plus

- Ability to see extra places (outside of kivu)
