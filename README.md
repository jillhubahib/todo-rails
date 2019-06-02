# Todo List in Ruby on Rails

## Learning Objective
- Know Ruby on Rails
- Authentication with Devise
- Debugging in Rails
- Deploy Heroku

## Ruby on Rails
- is the most popular web (MVC) framework in Ruby
- created in 2004 by David Heinemeier Hansson (DHH)

### Doctrine
- [Optimize for programmer happiness](https://rubyonrails.org/doctrine/#optimize-for-programmer-happiness) - core motivation for creating Ruby
- [Convention over Configuration](https://rubyonrails.org/doctrine/#convention-over-configuration) - “You’re not a beautiful and unique snowflake”. It postulated that by giving up vain individuality, you can leapfrog the toils of mundane decisions, and make faster progress in areas that really matter.
- [The menu is omakase](https://rubyonrails.org/doctrine/#omakase) - A way to eat well that requires you neither be an expert in the cuisine nor blessed with blind luck at picking in the dark.
- [No one paradigm](https://rubyonrails.org/doctrine/#no-one-paradigm)
- [Exalt beautiful code](https://rubyonrails.org/doctrine/#beautiful-code)
- [Provide sharp knives](https://rubyonrails.org/doctrine/#provide-sharp-knives)
- [Value integrated systems](https://rubyonrails.org/doctrine/#integrated-systems) - Rails can be used in many contexts, but its first love is the making of integrated systems: Majestic monoliths! A whole system that addresses an entire problem. This means Rails is concerned with everything from the front-end JavaScript needed to make live updates to how the database is migrated from one version to another in production.
- [Progress over stability](https://rubyonrails.org/doctrine/#progress-over-stability)
- [Push up a big tent](https://rubyonrails.org/doctrine/#big-tent)

## [Code Walkthrough](https://github.com/jillhubahib/todo-rails/commits/master)

## Deployment
### Create Heroku account
[Signup for free to Heroku](https://signup.heroku.com/) and [install its CLI tools](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)

### Create the app
```
$ heroku create fullscale-todo-rails
```

### Verify heroku is added
```
$ git remote -v
heroku  https://git.heroku.com/fullscale-todo-rails.git (fetch)
heroku  https://git.heroku.com/fullscale-todo-rails.git (push)
origin  https://github.com/jillhubahib/todo-rails.git (fetch)
origin  https://github.com/jillhubahib/todo-rails.git (push)
```

### Setup database
- Add or install the Heroku Postgres or you may run command `heroku addons:create heroku-postgresql:hobby-dev`
- Get your database name, user and password by running command `heroku pg:credentials:url` then you should have it in the connection info string in this example format `dbname=XXX user=XXX password=XXX`.
- Set the DATABASE_NAME, DATABASE_USER, and DATABASE_PASSWORD by running example commands:
```
heroku config:set DATABASE_NAME=XXX
heroku config:set DATABASE_USER=XXX
heroku config:set DATABASE_PASSWORD=XXX
```

### Deploy to Heroku
```
$ git push heroku master
```

### Run migration
```
$ heroku run bundle exec rake db:migrate
```

### Access the app
```
$ heroku open
```

## Resources

- [Rails Doctrine](https://rubyonrails.org/doctrine/)
- [Ruby on Rails Fundamentals](https://insights.dice.com/ruby-on-rails-fundamentals/)
- [Ruby on Rails Guides](https://guides.rubyonrails.org)