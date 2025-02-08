# 🚀 Rails Project with PostgreSQL Setup Guide

This guide provides step-by-step instructions to set up **PostgreSQL** as the database for your Ruby on Rails project.

---

## **🛠 Prerequisites**
Ensure you have the following installed:

- **Ruby** (Use `rbenv` or `RVM`)
- **Rails** (`gem install rails`)
- **PostgreSQL** (`brew install postgresql` on macOS)

---

## ** Step 1: Start PostgreSQL**
Before working with your Rails project, ensure **PostgreSQL is running**:

**Verify PostgreSQL is running:**

pg_ctl -D /usr/local/var/postgres status

Expected output:

pg_ctl: server is running

## ** Step 2: Create a New Rails Project with PostgreSQLgreSQL**
To create a new Rails project using PostgreSQL as the database:
rails new my_new_project --database=postgresql

Move into the project directory:
cd my_new_project

## ** Step 3: Configure database.yml**
Edit the config/database.yml file and update it to match your PostgreSQL setup.
nano config/database.yml

Modify the default section:
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: postgres
  password: ""
  host: localhost
  port: 5432

Save and exit (Ctrl + X, then Y, then Enter).

 ## **  Step 4: Install Dependencies**
Run:
bundle install

rails db:create
rails db:migrate

rails s