# Ruby on Roids
Ruby on Roids is a hackathon project initially developed by:
* [Aconime](https://github.com/Aconime)
* [aljadepalaran](https://github.com/aljadepalaran)
* [department19](https://github.com/department19)

## General Information
Tech stack: Ruby on Rails </br>
Ruby Version: 3.0.0 </br>
Rails Version: 7.x.x

## Setup
1. Install the gem dependencies using `bundle install`
2. Create the database with `bundle exec rails db:create`
3. If the previous command didn't already, run the migrations with `bundle exec rails db:migrate`
4. Seed the database using the command `bundle exec rails db:seed`, this can take some time
5. Start the server using `bundle exec rails server`

## Test Suite
The test suite will use RSpec.</br>
RSpec suite can be run using `bundle exec rspec spec`

## Services
There are currently no other services required for the application.</br>
This is most likely going to change in the future as we implement caching and background jobs.

## Contributing
This repository is currently being developed by the three stated at the top.</br>
If you wish to help us with development, please reach out to any of us.