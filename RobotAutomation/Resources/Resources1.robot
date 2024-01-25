*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${Browser}      Chrome
${URL}          http://www.thetestingworld.com/testings


*** Keywords ***
Close Browser Window
    ${Title}=   Get Title
    Log     ${Title}
    Close Browser

Start Browser and Maximize 1
    [Documentation]     User defined Keyword without Argument
    Open Browser    ${URL}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
  
Start Browser and Maximize 2
    [Documentation]     User defined Keyword with Argument
    [Arguments]     ${UserURL}  ${InputBrowser}
    Open Browser    ${UserURL}  ${InputBrowser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window

Start Browser and Maximize 3
    [Documentation]     User defined Keyword with Return Value
    [Arguments]     ${UserURL}  ${InputBrowser}
    Open Browser    ${UserURL}  ${InputBrowser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    ${Title}=   Get Title
    # Log     ${Title}
    RETURN    ${Title}
 
Before Each Test Suite
    Log     Before Each Test Suite

After Each Test Suite
    Log     After Each Test Suite


