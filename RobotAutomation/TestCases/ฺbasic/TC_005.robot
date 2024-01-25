*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Resources1.robot
Documentation   This File having testcase of testing ABC Functionality
Test Timeout    2mins 30s



*** Variables ***
${browser}          Chrome
${url_testing}      http://www.thetestingworld.com/testings


*** Test Cases ***
TC_001 User defined Keyword without Argument
    [Documentation]     This test case is User defined Keyword without Argument
    # [Timeout]       3s Failed to Execute First Test Case
    Start Browser and Maximize 1
    Input Text      name:fld_username       Hello World
    Close Browser

TC_002 User defined Keyword with Argument
    [Documentation]     This test case is User defined Keyword with Argument
    Start Browser and Maximize 2     ${url_testing}  ${browser} 
    Input Text      name:fld_username       Hello World
    Close Browser

TC_003 User defined Keyword with Return Value
    [Documentation]     This test case is User defined Keyword with Return Value
    ${Res}=    Start Browser and Maximize 3     ${url_testing}  ${browser} 
    Input Text      name:fld_username       ${Res}
    Close Browser


