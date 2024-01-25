*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Resources1.robot
Documentation   This File having testcase of testing ABC Functionality
Test Setup      Start Browser and Maximize 1
Test Teardown   Close Browser Window




*** Variables ***
${browser}          Chrome
${url_testing}      http://www.thetestingworld.com/testings


*** Test Cases ***
Robot Third Test Case
    [Tags]  Sanity
    Input Text      name:fld_username       Hello World
    Input Text      name:fld_email          testingworldindia@gmail.com
    Input Text      name:fld_password       123456

Robot Third Next Test Case
    [Tags]  Regression
    Select Radio Button 	 add_type 	 office