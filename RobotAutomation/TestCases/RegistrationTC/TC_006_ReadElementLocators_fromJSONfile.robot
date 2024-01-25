*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Resources2.robot


*** Variables ***



*** Test Cases ***
Read Element Locators from JSON file
    [Tags]  Smoke
    Start Browser and Maximize
    ${username}=    Read Element Locators   Registration.username_textbox_name
    Input Text      name:${username}       Hello World
    ${email}=    Read Element Locators   Registration.email_textbox_name
    Input Text      name:${email}          testingworldindia@gmail.com
    ${password}=    Read Element Locators   Registration.password_textbox_name
    Input Text      name:${password}       123456
    Close Browser Window