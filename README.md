# Sample Meetup Site

## Getting Started
To run the application:

    bundle install
    rake db:setup
    rails s

Note that 3 sample groups are created during the `rake db:seed` step of `rake db:setup`.  

## Demo Site
https://sample-meetup-site-heroku-22.herokuapp.com/


## App Specifications:
This application was created as part of a job interview process. Below were the specifications used to design the application:

- This app stores Users and the Groups they attend. Users have first names and last names.
Groups have a name. Users can attend multiple groups and have roles in each group. The roles
are: Organizer, Presenter, Participant.
- The app should have all CRUD actions for Groups. (User CRUD is unnecesary for the exercise)
- The app should take a CSV file upload in a web ui of the following format:
    - First Name, Last Name, Group Name, Role in Group
  
  From this CSV the app should associate the Users to their Groups.
The show action for a Group should display its Users and their Roles.
The index action for Groups should display the Organizer(s).

## Sample Usage
The site is initally empty:
   <img width="1309" alt="Screen Shot 2023-04-23 at 12 05 34 AM" src="https://user-images.githubusercontent.com/4614468/233820874-009c1587-b88e-407e-80a4-3c52b92b69f2.png">

### Adding a new Group
Currently, any user - logged in or not - can add a new group.  This can be done by clicking the **New** button, which redirects the user to this form:
   <img width="1309" alt="Screen Shot 2023-04-23 at 12 01 00 AM" src="https://user-images.githubusercontent.com/4614468/233820895-fca7e09b-3024-419e-9602-3a04da4b8678.png">

Once the form is submitted, the user has the opportunity to add an existing user to the group, and specify that user's role within the organization:
   <img width="1309" alt="Screen Shot 2023-04-23 at 12 01 19 AM" src="https://user-images.githubusercontent.com/4614468/233820911-cd99bf81-13d0-42a6-8ea3-8b7d45384299.png">

When the user clicks the **New** button, they are redirected to the form below, which allows them to select from a list of registered users on the site, and specify their role.  Technically, this page can be used to add users to any group on the site:
   <img width="1309" alt="Screen Shot 2023-04-23 at 12 03 03 AM" src="https://user-images.githubusercontent.com/4614468/233820948-7660f2a1-8c66-49ce-a706-b9c04fba291f.png">

Once the form has been submitted, the user can view the list of group members.  They can also delete any members as needed. (Unfortunately, member roles cannot be edited currently; but the member can be deleted and re-added to the group with the correct role):
   <img width="1309" alt="Screen Shot 2023-04-23 at 12 03 17 AM" src="https://user-images.githubusercontent.com/4614468/233820993-a1e63d41-2632-4ccc-9eb6-76bf6fc5213a.png">

The new group now shows up on the main page:
   <img width="1309" alt="Screen Shot 2023-04-23 at 12 04 21 AM" src="https://user-images.githubusercontent.com/4614468/233821035-f6c1dff2-567f-40a4-b63a-c1b811043326.png">

### Bulk Adding a new Group
Groups can be bulk-added to the site via csv file.  The csv must have 4 columns: First Name, Last Name, Group Name, and Role.  These columns can be re-named as desired, but corresponding data must be in this order. A header row is currently required, but this requirement may be removed in future releases as the column names currently just serve as placeholders with no other purpose.  New or existing users and groups can be specified in this file.  Any new users that are created will have a default password of `Test123` set for them, along with an auto-generated email address.

#### Example csv contents:
```
First Name,Last Name,Group Name,Role in Group
John,Doe,Tech Meetup Group,Organizer
Jane,Smith,Tech Meetup Group,Presenter
Michael,Johnson,Tech Meetup Group,Participant
Sara,Lee,Tech Meetup Group,Participant
Amanda,Rodriguez,Fitness Group,Organizer
```

The csv can be uploaded to the site by clicking the **Upload File** button on the main page.  From here you can select a file and submit the file for processing:
<img width="1272" alt="Screen Shot 2023-04-23 at 1 06 32 AM" src="https://user-images.githubusercontent.com/4614468/233848668-8fe09f2f-8f55-4755-af19-f95708c00645.png">

The results of processing are shown in a blue box once complete.  If an error occurred while processing one or more of the records in the file, the site will note the error, but will continue to process the other rows.  Here is an example of a completely successful upload:
<img width="1272" alt="Screen Shot 2023-04-23 at 1 07 05 AM" src="https://user-images.githubusercontent.com/4614468/233848957-ebb01645-fa9d-4e36-a116-e18880c293a6.png">

Here is an example of a file with errors:
#### Example csv contents:
```
First Name,Last Name,Group Name,Role in Group
John,Doe,Test 123,Organizer
Jane,Smith,Tech Meetup Group
Susie,Smith,,Participant
```

Results:
<img width="1214" alt="Screen Shot 2023-04-23 at 11 21 38 AM" src="https://user-images.githubusercontent.com/4614468/233851800-3db13ca2-f5f9-4a44-af8a-04bead023de7.png">

In the example above, only the Test 123 group is created successfully:
<img width="1232" alt="Screen Shot 2023-04-23 at 11 23 24 AM" src="https://user-images.githubusercontent.com/4614468/233851840-fd7e3339-36e1-4000-b495-e2796357da70.png">

### Editing Groups In-Place
Groups can be edited in-place by simply clicking the underlined text in the table, and clicking the check mark once editing is complete:
<img width="1232" alt="Screen Shot 2023-04-23 at 11 25 03 AM" src="https://user-images.githubusercontent.com/4614468/233851926-9318d3bc-f225-40c5-aadf-3914c13aaf31.png">

### Registration and Login
Users are also able to register and login to the site.  Currently, logged-in users have the same access to the site and unauthenticated users, but designated access is a feature that can be added to this site in the future:
* Login page:
   <img width="1309" alt="Screen Shot 2023-04-23 at 12 13 12 AM" src="https://user-images.githubusercontent.com/4614468/233821046-05f13cd4-2f2a-4399-99b8-22c3c61c80cd.png">
* Registration page:
   <img width="1309" alt="Screen Shot 2023-04-23 at 12 13 00 AM" src="https://user-images.githubusercontent.com/4614468/233821081-9993e59b-bbf2-446e-96ce-b014ff3404f8.png">
