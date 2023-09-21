# Xtwitter (Twitter Clone) 

**Exercise Requirements:**

Based on the models and migrations you created in the previous practice add the following validations to your models:

- Tweet Model:

    Add presence validation for a tweet body but only when is a tweet or a quote, when is a retweet it should be null
    Add 255 characters length validation 

- Replies Model

    Add presence validation for the reply body
    Add 255 characters length validation 

- User Model

    Add presence validation for email and username
    Add Uniqueness validation for email and username
    Add presence validation for password
    Add Length validation of 12 characters minimum
    Add Format validation At least 1 uppercase letter, at least 1 lowercase letter, at least 1 number and at least 1 special character like !@/*-+_
    if password field didn't exist before in your model add it with a new migration and apply the corresponding validations

- Hashtag

    Add presence validation for a hashtag name

- Likes

    Add uniqueness validation for tweet_id and user_id, a user can only like a tweet once

- Follower

    Add uniqueness validation for follower_id and follwee_id, a user can only follows another user once

- In additional to the validations requested above, you should add association validations to all your model


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
-    git clone -b m2-practice-lab-2 https://github.com/penaherrera/xtwitter.git
    
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