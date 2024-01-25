*** Settings ***
Library     SeleniumLibrary




*** Variables ***
${Browser}      Chrome
${URL}          http://www.thetestingworld.com/testings
${URL_thetestingworld}  https://www.thetestingworld.com/
${URL_google}   https://www.google.com/
${URL_robot}    https://robotframework.org/


*** Test Cases ***
# Multi Window Handling
TC_001 Handle Multiple Browser
    Open Browser    ${URL_thetestingworld}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Open Browser    ${URL_google}   ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Switch Browser 	 1
    ${url1} =   get location  
    log to console  ${url1}
    click element   //a[text()='Quick Demo']
    Switch Browser 	 2
    ${url2} =   get location  
    log to console  ${url2}
    Input Text 	 name:q     HelloWorld
    close all browsers 


TC_002 Handle Multiple Tabs
    Open Browser    ${URL_robot}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Click Element   //a[text()='robotic process automation (RPA)']  modifier=ctrl
    switch window   Robot Framework

    # # Multiple Browser
    # ${url1}=    get location        
    # log to console  ${url1}
    # switch window    RPA | Robot Framework
    # ${url2}=    get location        
    # log to console  ${url2}

    # Multiple tabs 
    @{handles}    get window handles  
    FOR     ${handle}    IN      @{handles}
        log to console      ${handle}
        switch window   ${handle}
        ${url}=     get location
        log to console      ${url}
    END 
    close all browsers 

   





*** Keywords ***