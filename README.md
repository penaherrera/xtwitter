# Xtwitter (Twitter Clone) 

**Exercise Requirements:**

Based on the Twitter database model created in Lecture 3.1, add support for the following features:

- Tweet Replies
- Bookmarks
- Likes
- Quotes
- Retweets
- Followers

In this repository, we are creating the migrations and associations necessary to achieve the requirements from the lab.

**Note:** There is a graphical image of the DB Model to fully understand how the migrations and models are related in the "xtwitter/docs" path.

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
-    git clone -b Practice-Lab-1-Twitter-Data-Modeling https://github.com/penaherrera/xtwitter.git
    
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