# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

**Features**

      1. Browse and search for rental properties by  type, city, district, net size, rent per month.
      2. Can add to favourites and remove from favourites.
      3. It will store all the favourites properties till it was not removed from the favourites by the user.

**Technologies**

  The application is built using the following technologies:
      Postgresql: for the database to store movie information, user information, and user actions
      Ruby: for the core language of Rails framework
      Rails: Web application framework build in ruby programming language.
      RSpecs: for automated testing.


Prerequisite
============
Ruby 3.2.2
Rails 7.0.1
Bundler 2.3.5
PG (~> 1.1)

- Running the app:

You can run the rspec using the following command:

```c
$ bundle install
```

```c
bundle exec rails db:create db:schema:load db:seed
```

To start
```c
bundle exec rails server
```

Make sure the tests pass before you push the changes by running:

  bundle exec rspec spec


What changes we expected to do in future

  Planning to embedded the option of add image for the admin user and also update option of the same.

  If you find a bug or would like to contribute to the application, feel free to open an issue or submit a pull request. Contributions are welcome and appreciated