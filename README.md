# Xtwitter (Twitter Clone) 

**Exercise Requirements:**

For this practice lab you are going to define the routes for the features described below and define requests specs that matches those features.


NOTE: UNDER NO CIRCUMSTANCE YOU SHOULD IMPLEMENT THE LOGIC BEHIND THOSE SPECS, THOSE CONTROLLERS WILL BE CREATED AS PART OF PRACTICE LAB 3 ANY IMPLEMENTATION WILL RESULT IN THE ELIMINATION OF THIS EVALUATION

NOTE 2: FOR ALL THE ROUTES THAT ARE DEPENDENT OF THE EXISTENT OF A USER THINK THE OWNER OF THAT RESOURCE IS GOING TO BE CURRENT LOGGED IN USER

### Features:
-   Create tweet: Route a user would use to create a new tweet

-    Update tweet: Route a user would use to update an existent tweet

-    Like Tweet: Route a user would use to like an existent tweet

-    Unlike Tweet: Route a user would use to unlike an existent tweet

-    Retweet: Route a user would use to retweet an existent tweet

-    Quote: Route a user would use to Quote an existent tweet

-    Reply: Route a user would use to reply an existent tweet

-    Bookmark: Route a user would use to bookmark an existent tweet

-    User Tweets: Route a user would use to see any user (him/her self included) tweets, also this route should be paginated, meaning the results should be return in blocks

-    User Tweets & Replies: Route a user would use to see any user (him/her self included) tweets AND replies, meaning replies can be returned as a non nested element, also this route should be paginated, meaning the results should be return in blocks

-    Tweet Stats: Route a user would use to get the stats of how many times an existent tweet have been quoted, retweeted, replied, bookmarked or liked.


-    Routes defined in routes.rb and they should be visible by running bin/rails routes or http://localhost:3000/rails/info/routes
-    Routes specs for the routes defined above
## Requirements and dependencies:

- Ruby version: 3.1.2
- Rails version: 7.0.6

## Getting Started:
Ruby and Rails Installation:

Make sure you have Ruby and Rails installed on your system. You can download and install them from the official Ruby and Rails websites or use a version management tool like RVM.


## To clone the repository, follow these steps:
Clone this repository to your local machine.
- git clone https://github.com/penaherrera/xtwitter.git

Navigate to the project directory.
- cd xtwitter

### In case doesn't work try:
Clone the branch.
-    git clone -b m3-practice-lab-1 https://github.com/penaherrera/xtwitter.git
    
 Navigate to the project directory.
-    cd xtwitter


### To create the database and run the necessary migrations, follow these steps:
Run the following commands to set up the database and execute the migrations:
- rails db:create
- rails db:migrate

## Running the Application:

Once the database is set up, you can start the Rails server:
- rails server

## Testing:

To run the test suite, you can use the following command:
- rails test

## Deployment:

For deploying this application to a production server, please refer to the official Ruby on Rails deployment documentation and hosting services like Heroku, AWS, or DigitalOcean.

## Additional Notes:

This Twitter clone project serves as a learning exercise to implement and understand various features commonly found in social media platforms. The provided database model and associations are essential for achieving the specified requirements. For a comprehensive understanding of the project, refer to the graphical image of the database model located in the "xtwitter/docs" path.