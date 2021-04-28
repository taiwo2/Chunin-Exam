# Link For shortening APP

> This project acts as a medium to complete the **Helpjuice Chunin Exam**.

## Getting started

- Clone the repo: `https://github.com/taiwo2/Chunin-Exam.git`
- `cd` into the directory
- `git pull origin url-shortening-app`
- Run `bundle install` and `yarn install` to install all the dependencies
- You may need to run `rails db:create db:migrate` to setup the db
- Run `rails s` to start the server
- Run `ruby bin/webpack-dev-server` to start the webpack server
- Open `localhost:3000` in your browser

## Features

- User authentication
- Shorten long URLs
- Analyze your link clicks (e.g.: link click count, browser used, devices used)
- View your link stats with the help of charts
- Create, edit, destroy shortened URLs
- User authorization to prevent unnecessary access
- Responsive website

## App flow

- First you need to sign up or sign in
- You'll be redirected to an app page, where you can shorten a URL
- After creating you'll be redirected to URL show page
- The show page normally lists all the stats about the link, if it has been clicked
- Click on the link, you'll be redirected to the actual website
- Navigate back to URL show page, refresh the browser if you haven't. You can now see all the stats that are available

## Stimulus
Install and use stimulus to show off some of that JavaScript magic.

Please try to put as much of your JavaScript into Stimulus controllers as possible!

## Tests

Tested using:

- RSpec
- Capybara
- Pundit matchers

I have tried to cover almost all the cases. Run `bundle exec rspec` to run the test suite.

## Author's contact info

### Taiwo Adetona

- GitHub: [Taiwo Adetona](https://github.com/taiwo2)
- Twitter: [@Adetona4](https://twitter.com/TaiwoAdetona4)
- LinkedIn: [Taiwo Adetona](https://www.linkedin.com/in/taiwo-adetona/)

## Acknowledgement

Thank you for giving me the chance to prove my skills.
