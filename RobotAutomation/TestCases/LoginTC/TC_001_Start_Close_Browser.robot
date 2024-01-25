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
Robot First Test Case
    [Tags]  Smoke
    Input Text      name:fld_username       Hello World
    Input Text      name:fld_email          testingworldindia@gmail.com
    Input Text      name:fld_password       123456

Robot First Next Test Case
    [Tags]  Smoke   Sanity
    Select Radio Button 	 add_type 	 office

