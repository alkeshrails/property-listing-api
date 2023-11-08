
# Property Rental Application

This README provides instructions for setting up and running the Property Rental Application.

## Features

1. Browse and search for rental properties by type, city, district, net size, and rent per month.
2. Add properties to your favorites list and remove them when needed.
3. The application stores your favorite properties until you remove them.

## Technologies

The application is built using the following technologies:

- **Database**: PostgreSQL is used to store property information, user data, and user interactions.
- **Language**: Ruby serves as the core language for the Rails framework.
- **Framework**: Rails is a web application framework written in Ruby.
- **Testing**: RSpec is used for automated testing.

## Prerequisites

Make sure you have the following software installed on your system:

- Ruby 3.2.2
- Rails 7.0.1
- Bundler 2.3.5
- PostgreSQL (PG)

## Getting Started

1. Clone the repository to your local machine.

2. Install the required dependencies:

   ```bash
   bundle install
    ```
3. Create the database schema and seed data:

    ```bash
    rails db:create db:schema:load db:seed
    ```

    Note: Seeding Database is necessary for creating default credentials for login

    **Admin Credentials**
    Email: `pladmin@mailinator.com`
    Password: `password@admin`

    **User Credentials**
    Email: `pluser@mailinator.com`
    Password: `password@user`

4. Start the application:
      ```bash
      rails server -p 3001
      ```

5. Make sure the tests pass before pushing changes:
    ```bash
    rspec spec
    ```

## Features

Planned improvements for the application:
- Add the ability for admin users to upload property images.
- Configure a Rake task for scraping properties from the UrHouse website.
