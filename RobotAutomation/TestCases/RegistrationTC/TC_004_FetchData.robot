*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Resources1.robot
Documentation   This File having testcase of testing ABC Functionality




*** Variables ***
${browser}          Chrome
${url_testing}      http://www.thetestingworld.com/testings


*** Test Cases ***
Robot Fetch Data
    Open Browser    ${url_testing}  ${browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    ${PageTitle}=   Get Title
    Log     ${PageTitle}
    ${Speed}=   Get Selenium Speed
    Log     ${Speed}
    ${Value}=   Get Value   //input[@type='submit']
    Log     ${Value}
    ${Text}=   Get Text   //a[@class='displayPopup']
    Log     ${Text}
    Close Browser  


Robot Fetch Data 2
    Open Browser    ${url_testing}  ${browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Select From List By Index   name:sex    1
    ${Val}=     Get Selected List Value     name:sex    
    Log     ${Val}
    ${Text}=    Get Selected List Label     name:sex
    Log     ${Text}
    ${AllLabels}=   Get List Items      name:sex   
    Log     ${AllLabels}
    Close Browser    


Robot Fetch Data 3
    Open Browser    ${url_testing}  ${browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Select From List By Index   name:sex    1
    ${ActualURL}=     Get Location     
    Log     ${ActualURL}
    ${PageHTML}=    Get Source
    Log     ${PageHTML}
    ${Attr}=   Get Element Attribute    name:fld_username   class
    Log     ${Attr}
    ${cnt}=    Get Element Count    class:field
    Log     ${cnt}
    Close Browser    