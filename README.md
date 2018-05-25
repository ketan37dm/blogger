# Blogger

In this project, I have tried out the GraphQL.
* We create a simple blogger application where User has many posts and posts have many comments.
* We create define our types and mutations inside `app/graphql` folder
* We implement the Relay Node interface so that we could use cursors for pagination
* We use the GraphIQL for front API exploration

## Installation instructions

Installation steps are pretty straight forward

* Clone the repository
* Perform following steps
  - bundle install
  - rake db:create
  - rake db:migrate
  - rake db:seed
  - rails s
  - visit `localhost:3000/graphql` and try the API

Cheers ! 
