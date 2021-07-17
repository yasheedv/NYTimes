# NYTimes

A simple app to hit the NY Times Most Popular Articles API and show a list of articles, that shows details when items on the list are tapped (a typical master/detail app). 

We'll be using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?api-key=sample-key

For testing this API, we used 
* all-sections for the section path component in the URL
* 30 for period

#Xcode - Version 12.5.1

#Language - Swift 5

## Overview

Covers the following
  * MVVM patter
  * Unit test and code coverage
  
## Installation
  Simply clone the project and run.

 
 ### Usage
#### Run the project
  1. Press command + R or Product -> Run

#### Run Unit Test
  1. Press commnad + U or Product -> Test

#### Generate code coverage
  1. Make sure that the code coverage is marked under Test scheme options.
  2. Press command + U
  3. Wait to complete the unit test cases
  4. To see the code coverage report, open the Report Navigator on the left, select the report for the last test run, and open the Coverage tab.

