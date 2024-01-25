*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Resources2.robot
Documentation   This File having testcase of testing ABC Functionality




*** Variables ***
${browser}          Chrome
${url_testing}      http://www.thetestingworld.com/testings


*** Test Cases ***
User defined keywords using Python
    # Create Folder at Runtime    India
    Concatenate Username Password       Testing     World
    Open Browser    ${url_testing}  ${browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Close Browser    