# Teller API

[Live Link](https://teller-api.herokuapp.com/api/v1/assets)

## Relevant Links

 * [Agile Board](https://waffle.io/DanielMulitauopele/teller)

 * [Teller App Production](https://teller-app.herokuapp.com/)
 * [Teller App Repository](https://github.com/DanielMulitauopele/teller)
 * [Teller A.I. Production](https://github.com/DanielMulitauopele/teller-ai)
 * [Teller A.I. Repository](https://github.com/DanielMulitauopele/teller-ai)
 * [Teller Prototype Production](https://danielmulitauopele.github.io/teller-js/)
 * [Teller Prototype Repository](https://github.com/DanielMulitauopele/teller-js)

## Table of Contents

* [Description/Purpose](#descriptionpurpose)
* [System Requirements](#system-requirements)
* [Setup](#setup)
* [Dependencies](#dependencies)
* [Contributors](#contributors)
* [API Endpoints](#api-endpoints)
    * [Assets](#assets)
        * [Retrieve All Assets](#get-apiv1assets)
        * [Retrieve An Asset](#get-apiv1assetsid)
    * [Exchanges](#exchanges)
        * [Retrieve All Exchanges](#get-apiv1exchanges)
    * [Transactions](#transactions)
        * [Retrieve All Transactions](#get-apiv1transactions)
    * [Coin Price History](#history)
        * [Retrieve All History Snapshots](#get-apiv1assetsidhistoryinterval)
    * [Favorites](#favorites)
        * [Retrieve All Favorites](#get-apiv1favorites)
    * [Notes](#notes)
        * [Retrieve All Notes](#get-apiv1notes)

## Description/Purpose

This back-end application was initiated as the last solo project for Module 3 of the Back-End Engineering program at Turing School of Software and Design, and is continued as the final Capstone project for Mod 4. Students were tasked with designing a back-end API at the end of Module 3 that would be consumed in the initial week of the final mod. For the capstone, the project was expected to expand in scope. For this project, I chose to create a cryptocurrency-based API that consumed data from the CoinCap API as well as the ShapeShift API. The back-end was designed using Ruby on Rails, and in addition to a Django backend service that analyzes the tone of coin-related tweets, serves a separate front-end. The initial front-end was designed solely with HTML, CSS, and JavaScript, and served as a prototype for what the app would become in later iterations. Its current iteration is built using React and Redux.

## System Requirements

This application requires several technologies to be installed to your local
machine. The following are required:

1. [Ruby on Rails](https://rubyonrails.org/)
2. [PostgreSQL](https://www.postgresql.org/)

## Setup

To run this application locally, take the following steps:

* Clone this repository down into a local directory of your choice.
* Navigate(cd) into teller-api
* Run bundle
* Run bundle update
* Run rake db:{drop,create,migrate}
* Run rspec to run the test suite
* Run rails s to open a local server

## Dependencies

**Production**

* Faraday
* Figaro
* JSON Web Tokens
* Rack-CORS

**Development**

* Database Cleaner
* Factory Bot
* Faker
* Launchy
* Shoulda-Matchers

## Core Contributors

* [Daniel Mulitauopele](https://github.com/DanielMulitauopele)
* [Autumn Martin](https://github.com/Autumn-Martin)

## How to Use

The application uses only 3 endpoints in its current iteration, with more to come in the future. These endpoints are loaded with data that is pulled from the ShapeShift API, as well as the CoinCap API. Future iterations will utilize Twitter's API and IBM's Watson. In order, for the application to run on a local machine, the user will need an application.yml file that holds the required environmental variables. The variables below will allows the user to access the ShapeShift API and the CoinCap API. For Twitter, the user will need to acquire their own API key:

```
production:
  COINCAP_PATH: https://api.coincap.io
  SHAPESHIFT_PATH: https://shapeshift.io
```

The endpoints are as follows:

```
ASSETS       GET - https://guarded-reef-25579.herokuapp.com/api/v1/assets
EXCHANGES    GET - https://guarded-reef-25579.herokuapp.com/api/v1/exchanges
TRANSACTIONS GET - https://guarded-reef-25579.herokuapp.com/api/v1/transactions
```

## Known Issues

* Lack of authentication
* Twitter API is not yet connected, and the full functionality is still in development at this point.
* User does not yet have ability to access menu

## Running Tests

* Run rspec

## How to Contribute

* Not currently available for contributions.

## Style and Design

<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/landing-page.png" title="landing-page" width="270"><img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/log-in-page.png" title="log-in-page" width="250"><img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/sign-up-page.png" title="sign-up-page" width="250">
<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/assets-page.png" title="assets-page" width="250">
<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/exchanges-page.png" title="exchanges-page" width="250">
<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/transactions-page.png" title="transactions-page" width="250">
