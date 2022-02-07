# Ruby on Rails Alex's Blog

## Schema
### Users table


## Built with
- Ruby
- Ruby on Rails
- Javascript
- Html
- Css

## Requirements
- VSCode installed
- Rails 7 installed
- Ruby 3 installed
- PostgreSQL installed
  
## Installation
1 - On Github, on the main page of the RoR-blog, click the Code button and copy "Clone with HTTPS" by clicking the copy icon.
In your terminal, enter a git clone and past the link that you copied from the repository, and press the   Enter
(e.g. git clone https://github.com/Wikitelmex/recipe-project.git).

- To get a local copy up and running follow these steps.

2 - open your terminal and clone the project running 

`git clone https://github.com/Wikitelmex/recipe-project.git`

3 - install all the gems running

`bundle install`

4 - create the databases

`rails db:create`

4 - to run the project use

`rails s`

## API enpoints

The API endpoints uses JWT authentication, thats why you need to generate a token in the next endpoint:

### Login API endpoint
`http://localhost:3000/users/sign_in.json`

The body must fit this format
````
{
    "user": {
        "email": "some@mail.com",
        "password": "fakepassword"
    }
}
````
After you put valid credentials in JSON format, you'll get a response like this:
````
{
    "user": {
        "id": 1,
        "email": "wikitelmex@gmail.com",
        "name": "Alex",
        "bio": "the greatest developer in the entire world",
        "photo": "alex.jpg",
        "token": "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNjQ0MDk4MTAwfQ.LPt_qeMHPz6NsANBA7zgVzXPHZlgt8MRaH6WnfnBacs"
    }
}
````
That token is the one that you need in the below endpoints

## Testing

We use Rails built-in testing to test our code. 

You can run those tests locally running:
- `rspec`

## Author

👤 **Alex Castillo**
- GitHub: [Alex](https://github.com/Wikitelmex)
- Twitter: [@Alex](https://twitter.com/Alejand84515448)
- LinkedIn: [Alex Castillo](https://www.linkedin.com/in/alejandro-castillo-6849131a9/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!


## 📝 License

This project is MIT licensed.


* Ruby version 3.0.0

* Configuration file: config/application.rb

* Database creation script: config/database.yml

* Database initialization: db/schema.rb
