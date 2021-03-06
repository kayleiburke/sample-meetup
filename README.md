# Sample Meetup Site

## Getting Started
To run the application:

    bundle install
    rake db:setup
    rails s

## Demo
https://sample-meetup-site.herokuapp.com/


## App Specifications:
Below were the specifications used to design the application:

- This app stores Users and the Groups they attend. Users have first names and last names.
Groups have a name. Users can attend multiple groups and have roles in each group. The roles
are: Organizer, Presenter, Participant.
- The app should have all CRUD actions for Groups. (User CRUD is unnecesary for the exercise)
- The app should take a CSV file upload in a web ui of the following format:
    - First Name, Last Name, Group Name, Role in Group
  
  From this CSV the app should associate the Users to their Groups.
The show action for a Group should display its Users and their Roles.
The index action for Groups should display the Organizer(s).
