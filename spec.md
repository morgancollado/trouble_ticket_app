# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Sinatra was used to build this app 
- [x] Use ActiveRecord for storing information in a database - I have the ActiveRecord gem installed and it was used to build the database
- [x] Include more than one model class (e.g. User, Post, Category) - I have a user class and a ticket class 
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - a user has many tickets, aliased so that a user can be a customer and an admin
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - tickets belong to a user 
- [x] Include user accounts with unique login attribute (username or email) - my user model validates the uniqueness of any particular entry 
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - users can created, read, update and destroy their own tickets. admins can do this to any ticket 
- [x] Ensure that users can't modify content created by other users - i have helper methods that check if the ticket belongs to a particular user or if the user that is logged in is an admin
- [x] Include user input validations - ticket validates the presence of content and title 
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message