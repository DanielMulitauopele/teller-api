# Teller API

[Live Link](https://teller-api.herokuapp.com/api/v1/assets)

## Relevant Links

 * [Agile Board](https://waffle.io/DanielMulitauopele/teller)

 * [Teller App Production](https://teller-app.herokuapp.com/)
 * [Teller App Repository](https://github.com/DanielMulitauopele/teller)
 * [Teller A.I. Production](https://teller-ai.herokuapp.com/)
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
    * [Assets](#assets-endpoints)
        * [Retrieve All Assets](#get-apiv1assets)
        * [Retrieve An Asset](#get-apiv1assetsid)
    * [Exchanges](#exchanges-endpoints)
        * [Retrieve All Exchanges](#get-apiv1exchanges)
    * [Transactions](#transactions-endpoints)
        * [Retrieve All Transactions](#get-apiv1transactions)
    * [Coin Price History](#history-endpoints)
        * [Retrieve All History Snapshots](#get-apiv1assetsidhistoryinterval)
    * [Favorites](#favorites-endpoints)
        * [Retrieve All Favorites](#get-apiv1favorites)
    * [Notes](#notes-endpoints)
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

* [Faraday](https://github.com/lostisland/faraday)
* [Figaro](https://github.com/laserlemon/figaro)
* [JSON Web Tokens](https://jwt.io/)
* [Rack-CORS](https://github.com/cyu/rack-cors)

**Development**

* [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [Factory Bot](https://github.com/thoughtbot/factory_bot)
* [Faker](https://github.com/stympy/faker)
* [Launchy](https://github.com/copiousfreetime/launchy)
* [Pry](https://github.com/pry/pry)
* [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
* [SimpleCov](https://github.com/colszowka/simplecov)

## Contributors

* [Daniel Mulitauopele](https://github.com/DanielMulitauopele)
* [Autumn Martin](https://github.com/Autumn-Martin)

## API Endpoints

The assets, exchanges, transactions, and history endpoints of this application pull directly from the CoinCap and Shapeshift API's. Users, Notes, and Favorites pull from the Teller database.

### Assets Endpoints

#### GET /api/v1/assets

Returns all assets from the CoinCap API.

**Request**
```
GET /api/v1/assets
```

**Response**
```json
[
  {
    "name": "Bitcoin",
    "rank": "1",
    "symbol": "BTC",
    "supply": "17460662.0000000000000000",
    "max_supply": "21000000.0000000000000000",
    "market_cap_usd": "67654273436.8413584576687298",
    "price_usd": "3874.6682936100222579",
    "percent_change_24_hr": "-0.6910179145803684"
  }, {
    "name": "Ethereum",
    "rank": "2",
    "symbol": "ETH",
    "supply": "104173601.4678000000000000",
    "max_supply": null,
    "market_cap_usd": "15649659054.6266973685607253",
    "price_usd": "150.2267257167258246",
    "percent_change_24_hr": "-1.2947653700466387"
  }
]
```

#### GET /api/v1/assets/:id

Returns a song with the specific given `:id`.

**Request**
```
GET /api/v1/assets/bitcoin
```

**Response**
```json
{
  "name": "Bitcoin",
  "rank": "1",
  "symbol": "BTC",
  "supply": "17460662.0000000000000000",
  "max_supply": "21000000.0000000000000000",
  "market_cap_usd": "67689983647.1601698750520544",
  "price_usd": "3876.7134743894687312",
  "percent_change_24_hr": "-0.5167689399092579"
}
```

### Exchanges Endpoints

#### GET /api/v1/exchanges

Returns all exchanges from the ShapeShift API.

**Request**
```
GET /api/v1/exchanges
```

**Response**
```json
[
  {
  "name": "Okex",
  "dollar_volume": "625686114.1643301116325033",
  "volume_percentage": "13.691983333390568938000000000000000000",
  "available_pairs": "500",
  "url": "https://www.okex.com/",
  "timestamp": 1546530623245
}, {
  "name": "Binance",
  "dollar_volume": "612767116.5340134454460197",
  "volume_percentage": "13.409274965354211093000000000000000000",
  "available_pairs": "377",
  "url": "https://www.binance.com/",
  "timestamp": 1546530623321
  }
]
```

### Transactions Endpoints

#### GET /api/v1/transactions

Returns 5 most recent transactions from the ShapeShift API.

**Request**
```
GET /api/v1/transactions
```

**Response**
```json
[
  {
  "currency_in": "ETH",
  "currency_out": "BTC",
  "amount": 0.39857166344869605,
  "timestamp": 1546530474.731
}, {
  "currency_in": "LTC",
  "currency_out": "BTC",
  "amount": 1,
  "timestamp": 1546530313.173
  }
]
```

### History Endpoints

#### GET /api/v1/assets/:id/history?interval=interval

Returns history of a specific coin sorted by desired interval (1min, 5min, 15min, 30min, 1hr, 2hr, 6hr, 12hr, 1day). User must be registered.

**Request**
```
GET /api/v1/assets/bitcoin/history?interval=h1
```

**Response**
```json
[
  {
  "price": "4018.0685318242561403",
  "time": 1543939200000,
  "supply": "17406450.0000000000000000",
  "date": "2018-12-04T16:00:00.000Z"
  },
  {
  "price": "3982.4547841844734652",
  "time": 1543942800000,
  "supply": "17406512.0000000000000000",
  "date": "2018-12-04T17:00:00.000Z"
  }
]
```

### Favorites Endpoints

#### GET /api/v1/favorites

Pulls favorited assets that have been saved to the database.

**Request**
```
GET /api/v1/favorites
```

**Response**
```json
[
  {
    "name": "bitcoin",
    "price_usd": "3874.6682936100222579",
    "percent_change_24_hr": "-0.6910179145803684"
  }, {
    "name": "ethereum",
    "price_usd": "150.2267257167258246",
    "percent_change_24_hr": "-1.2947653700466387"
  }
]
```

### Notes Endpoints

#### GET /api/v1/notes

Pulls notes that have been saved to the database.

**Request**
```
GET /api/v1/notes
```

**Response**
```json
[
  {
    "title": "note 1",
    "text": "note details"
  }, {
    "title": "note 2",
    "text": "note details"
  }
]
```

## How to Contribute

* Not currently available for contributions.

## Style and Design

<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/landing-page.png" title="landing-page" width="270"><img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/log-in-page.png" title="log-in-page" width="250"><img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/sign-up-page.png" title="sign-up-page" width="250">
<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/assets-page.png" title="assets-page" width="250">
<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/exchanges-page.png" title="exchanges-page" width="250">
<img src="https://github.com/DanielMulitauopele/teller-js/blob/master/lib/transactions-page.png" title="transactions-page" width="250">
