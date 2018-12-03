# Teller API

## Relevant Links
 * [Agile Board](https://waffle.io/DanielMulitauopele/teller-js)
 * [Teller JS Production](https://danielmulitauopele.github.io/teller-js/)
 * [Teller JS Repository](https://github.com/DanielMulitauopele/teller-js)
 * [Teller API Production](https://guarded-reef-25579.herokuapp.com/api/v1/assets)

## Introduction

This back-end application was built as the last solo project for Module 3 of the Back-End Engineering program at Turing School of Software and Design. Students were tasked with designing a back-end API at the end of Module 3 that would be consumed in the initial week of the final mod. For this project, I chose to create a cryptocurrency-based API that consumed data from the CoinCap API as well as the ShapeShift API. The front-end was designed solely with HTML, CSS, and JavaScript. The back-end was designed using Ruby on Rails.

## Initial Setup

* Clone this repository down into a local directory of your choice.
* Run bundle
* Run rails s to open a local server


## How to Use

The application uses only 3 endpoints in its current iteration, with more to come in the future. These endpoints are loaded with data that is pulled from the ShapeShift API, as well as the CoinCap API. Future iterations will utilize Twitter's API and IBM's Watson. The endpoints are as follows:

* ASSETS       GET - https://guarded-reef-25579.herokuapp.com/api/v1/assets
* EXCHANGES    GET - https://guarded-reef-25579.herokuapp.com/api/v1/exchanges
* TRANSACTIONS GET - https://guarded-reef-25579.herokuapp.com/api/v1/transactions

## Known Issues

* Lack of authentication
* Twitter API is not yet connected, and the full functionality is still in development at this point.
* User does not yet have ability to access menu

## Running Tests

* Run rspec

## How to Contribute

* Not currently available for contributions.

## Core Contributors

* [Daniel Mulitauopele](https://github.com/DanielMulitauopele)

## Style and Design

<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/landing-page.png" title="landing-page" width="270"><img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/log-in-page.png" title="log-in-page" width="250"><img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/sign-up-page.png" title="sign-up-page" width="250">
<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/assets-page.png" title="assets-page" width="250">
<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/exchanges-page.png" title="exchanges-page" width="250">
<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/transactions-page.png" title="transactions-page" width="250">

## Tools and Dependencies

* Rails
* Faraday
* Figaro
* Launchy
* Shoulda-Matchers
* Factory Bot
* Faker
* Database Cleaner
