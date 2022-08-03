# DRINK STORE

## **Description**

This app is designed to manage an smale drink store, in which you'll have one admin user(the first user created), adn many normal user.

The app gives teha admin the ability to create, update, list, and delete drinks, snacks, and promotions.

The admin is enable to watch all the views in the system, also can goes to the `Admin Panel` in which the admin can manage the previous descibed objects.

The normal users are enable to watch the static pages: Home, Drinks, Snacks, and Promotions active.

## **System dependencies**

This app was developed using the following software

* **Fedora Linux 36**
* **PostgreSQL RDBMS 14.3**
* **Ruby 2.7.6**
* **Rails 6.1.6.1**
* **NodeJS v16.14**
* **Yarn 1.22.19**

For PostgreSQL you'll need to have, at least, PostgreSQL version 9.x or above.

## **Up and running the app**

1. Download this repo
2. Create a POSTGRESQL DB user, executing the following command inside a psql session with an admin role:
    * ```CREATE ROLE WITH drinks_store WITH LOGIN CREATEDB PASSWORD 'abc123#'```
3. Inside the root folder of this app, download/update the necessary gems with the comamnd:
    * ```bundle install```

4. Download/update the external js packages using yarn with the following statement:
    * ```yarn```
5. Create the app DB to be used for with:
    * ```rails db:create```
6. Run the migrations with
    * ```rails db:migrate```
    * Optionally yo can populate the db with some values, executing ```rails db:seed```

7. Run the rails server with ```rails s```

8. Goes to ```http://localhost:3000```

The app comes with a set of tests and you can run the tests set executing the following command in the CLI of your system with the statement ```rspec```. If the previous statement doesn't work, you can use instead ```bundle exec rspec``` 