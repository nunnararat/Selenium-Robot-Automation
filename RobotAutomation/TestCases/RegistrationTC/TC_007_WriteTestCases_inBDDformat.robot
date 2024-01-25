*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Resources2.robot



*** Variables ***



*** Test Cases ***
Write Test Cases in BDD format
    Given Start Browser and Maximize
    When Create Folder at Runtime   ABCD     XYZM
    Then Concatenate Username Password  Testing  World   
    Close Browser Window
