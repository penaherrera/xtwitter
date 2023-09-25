# Xtwitter (Twitter Clone) 

**Exercise Requirements:**

Based on the models and migrations you created in the previous practice add the following query methods to your models:


- User tweets Scope: Create a new scope that retrieves the tweets of a user

- Tweets and Replies: Create a new scope that retrieves the tweets and replies of that same user

- Followers Count: Create a new scope that retrieves the number of followers a user has

- Following Count: Create a new scope that retrieves the number of users a user follows

- Retweets counts: Create a new scope that retrieves the number of retweets

- Quotes count: Create a new scope that retrieves the number of quotes

- Bookmarked tweets: Creates a new scope that retrieves the bookmarked tweets by a user

- Retweet method: Create a method that encapsulates the retweet logic accepting a user a parameter

- QuoteTweet: Create a method that encapsulates the retweet logic accepting a user an a text body as parameter

- Like a tweet: Create a method that encapsulates the like logic accepting a user

- Hashtag creation Method: Create a method that encapsulates the logic to scan a tweet body text and creates a new hashtag if it doesn’t exists and creates the new association between tweet and hashtag

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