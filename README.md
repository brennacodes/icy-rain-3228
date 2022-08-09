# B2 Assessments

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.7.4 and is based on Rails 5.2.8

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd <repo-name>`
5. `bundle install`
6. `rails db:{drop,create,migrate,seed}`


## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up (and not before), push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* How far you got through the user stories
  * Please include any user stories you partially complete, for example "completed user stories 1 and 2, really close to completing 3"

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## Overview

Field Trip is an app that tracks Airlines, Flights, and Passengers.

* Airlines (gardens) have many Flights (plots)
* Flights  (plots) belong to an Airline (garden)
* Passengers (plants) have many Flights (plots)
* Flights (plots) have many Passengers (plants)
* Airlines have a name
  * Ex: name: “Frontier”
* Flights have a number, date, departure city, and arrival city
 	* Ex: number: “1727”, date: “08/03/20”, departure_city: “Denver”, arrival_city: “Reno” -- for this app, it does not matter how you format the flight’s date
* Passengers have a name and age
  * Ex: name: “Joe”, age: 7

Some of the initial migrations and model set up has been done for you.

## User Stories

```
User Story 1, Flights Index Page

As a visitor
When I visit the flights index page
I see a list of all flight numbers
And next to each flight number I see the name of the Airline of that flight
And under each flight number I see the names of all that flight's passengers
```

```
User Story 2, Remove a Passenger from a Flight

As a visitor
When I visit the flights index page
Next to each passengers name
I see a link or button to remove that passenger from that flight
When I click on that link/button
I'm returned to the flights index page
And I no longer see that passenger listed under that flight

(Note: you should not destroy the passenger record entirely)
```

```
User Story 3, Airline's Passengers

As a visitor
When I visit an airline's show page
Then I see a list of passengers that have flights on that airline
And I see that this list is unique (no duplicate passengers)
And I see that this list only includes adult passengers

(Note: an adult is anyone with age greater than or equal to 18)
```

## Extensions

```
Extension, Frequent Flyers

As a visitor
When I visit an airline's show page,
Then I see that the list of adult passengers is sorted
by the number of flights each passenger has taken on the airline from most to least

(Note: you should only make 1 database query to retrieve the sorted list of passengers)
```
