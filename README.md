# Project/Volunteer-Tracker

#### Project/Volunteer-Tracker

#### By Kyle Kay-Perez

#### Shortcuts
- [Technologies Used](#technologies-used)
- [Description](#description)
- [Setup/Installation Requirements](#setup/installation-requirements)
- [Future Plans](#future-plans)
- [License](#license)
- [Contact Information](#contact-information)

## Technologies Used

* [Markdown](https://www.markdownguide.org/)
* [VS studio](https://code.visualstudio.com/)
* [Bootstrap](https://getbootstrap.com/)
* [Ruby](https://www.ruby-lang.org/en/)
* [Ruby Gems](https://rubygems.org/)
* [postgreSQL](https://www.postgresql.org/)

## Description

This is a program dedicated to creating projects and then adding volunteers to that project.

## Setup/Installation Requirements

* Clone this repository from github to your desktop: [Github link for this project](https://github.com/professional-pigeon/Vocab_charity)
* navigate to the top level of the directory
* run "gem install bundler" then "bundle install" in your terminal
* Install [postgreSQL](https://www.postgresql.org/) using instructions for your OS on their website.
* To use application you'll need to open a postgres server in a terminal
* run these commands direcly in the terminal line to recreate the SQL database and test database.
    - createdb volunteer_tracker
    - psql volunteer_tracker < database_backup.sql
    - createdb -T volunteer_tracker volunteer_tracker_test
* in your terminal you can run 'rspec' to run all tests, and 'ruby app.rb' to run the website while your postgres server is running.

## License

MIT License

Copyright (c) Kyle Kay-Perez 2021

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contact Information

Kyle.KayPerez@gmail.com