# Relational Rails

## Turing School of Software & Design Module 2 solo project

### Learning Goals for Relational Rails
* Design a one-to-many relationship using a schema designer.
* Write migrations to create tables with columns of varying data types and foreign keys.
* Use Rails to create web pages that allow users to CRUD resources.
* Create instance and class methods on a Rails model that use ActiveRecord methods and helpers.
* Write model and feature tests that fully cover data logic and user behavior.
#

### Contents
1. Setup
1. Design Strategy
1. Application
1. Future Goals
1. Contributer(s)
#

### Setup 

Students should create their own new Rails app using a one-to-many relationship.
#

### Design Strategy

The tables for this project must include columns represented on each table:
1. One string column for a ‘name’
1. One boolean column
1. One numeric column
1. Two DateTime columns: created_at and updated_at

The schema diagram for this project:
<img width="650" alt="Screenshot 2023-02-07 at 2 59 22 PM" src="https://user-images.githubusercontent.com/116698937/217364353-20fc9088-70e0-451b-83ab-a58355f5f779.png">
#

### Application

To run this program, clone this repo to your local machine. After doing so move it in the project directroy and run the following commands into the command line terminal: 

1. `bundle install`
1. `rails db:{drop,create,migrate,seed}`
1. `rails s `

If you open up your web browser and naviagate to `http://localhost:3000/` you should see the home page to this rails app.
#

### Future Goals

Project Status: _In Progress_

* Add functionality of sorting companies by the number of vessels they have
* Add functionality of searching for a vessel by it's name
* Add functionality of partial match for searching by company or vessel name

#
### Contributer(s)
This project was created solely by Harrison Ryan
#
email: <hwryan12@gmail.com>; github: [https://github.com/hwryan12](https://github.com/hwryan12)