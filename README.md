# Link shortener

> This project acts as a medium to complete the **Helpjuice Chunin Exam**.

## Getting started

- Clone the repo: `https://github.com/EmirVatric/Chunin-Exam.git`
- `cd` into the directory
- `git pull origin abeidahmed:url-shortener`
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

## Stimulus usage

- `form_error_controller`: Used to display form validation errors asynchronously
- `clipboard_controller`: Used to copy texts into the clipboard
- `sidebar_controller`: Used to hide and show the sidebar
- `toggle_controller`: Used to hide and show the element based on user interaction

## Tests

Tested using:

- RSpec
- Capybara
- Pundit matchers

I have tried to cover almost all the cases. Run `bundle exec rspec` to run the test suite.

## Ugly code due to constraints

`app/web_links_controller` `create` action - This is for sure the most ugly code in the entire project.
My initial implementation was to wrap the entire block in a `transaction` so
that when the `url` is valid but does not have a valid server (e.g.: `https://asdfsadfsadf.com`), it would
`rollback` the `record`. But to my surprise, `sqlite` does not support `transaction`s
fully. It locks the `db` completely and the only way to create additional links
is to reset the `db`, which is impractical.

## Author's contact info

### Abeid Ahmed

- GitHub: [@abeidahmed](https://github.com/abeidahmed)
- Twitter: [@iamhawaabi](https://twitter.com/iamhawaabi)
- LinkedIn: [Abeid Ahmed](https://www.linkedin.com/in/abeidahmed/)

## Acknowledgement

Thank you for giving me the chance to prove my skills.
