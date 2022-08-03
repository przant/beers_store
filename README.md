# DRINK STORE

## **Description** 

This app is designed to manage a small drink store, in which you'll have one admin user (the first user created), and many normal users (customers).

The app gives the admin the ability to create, update, list, and delete drinks, snacks, and promotions.

The admin is enabled to watch all the views in the system and also can go to the Admin Panel in which the admin can manage the previously described objects.

The normal users are enabled to watch the static pages: Home, Drinks, Snacks, and Promotions active.

## **System dependencies**

This app was developed using the following software:

* **Fedora Linux 36**
* **PostgreSQL RDBMS 14.3**
* **Ruby 2.7.6**
* **Rails 6.1.6.1**
* **NodeJS v16.14**
* **Yarn 1.22.19**

For PostgreSQL, you'll need to have, at least, PostgreSQL version 9.x or above.

## **Up and running the app**

From step #2 to step #9, all teh commands will be execute in root folder of the app.

1. Download this repository and change to the root directory
    * ```cd drinks_store```

2. Create a POSTGRESQL DB user, executing the following command inside a psql session with an admin role:
    * ```CREATE ROLE WITH drinks_store WITH LOGIN CREATEDB PASSWORD 'abc123#'```

3. Inside the root folder of this app, download/update the necessary gems with the command:
    * ```bundle install```

4. Download/update the external JavaScript packages using yarn with the following statement:
    * ```yarn```

5. Create the app DB to be used with:
    * rails db:create

6. Run the migrations with
    * ```rails db:migrate```

    * Optionally you can populate the DB with some values, executing ```rails db:seed```

7. In the terminal run the command: ```./bin/webpack-dev-server```

8. In another terminal tab starts the rails server with ```rails s```

9. Goes to ```http://localhost:3000```, you have to watch the home page of the app

The app comes with a set of tests and you can run the tests set by executing the following command in the CLI of your system with the statement ```rspec```. If the previous statement doesn't work, you can use instead ```bundle exec rspec```