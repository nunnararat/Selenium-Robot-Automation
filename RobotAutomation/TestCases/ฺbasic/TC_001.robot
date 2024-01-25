*** Settings ***
Library     SeleniumLibrary
Library     Collections



*** Variables ***
${Browser}      Chrome
${URL}          http://www.thetestingworld.com/testings

*** Test Cases ***
TC_000 set variable
    ${Var1} =   set variable    HelloWorld
    log to console      ${Var1}

TC_001 Variable Test
    @{List1}    create List     Hello   22  23.23   World   Abcd1234
    ${list_length}  get length  ${List1}
    log to console  ${list_length}
    ${list_data} =  get from list   ${List1}    3
    log to console  ${list_data}
    

TC_002 Variable Test Loop
    FOR    ${index}    IN RANGE    1    10
        Log to console    Index: ${index}
    END

TC_003 Variable Test Loop list
    @{List1}    create List     Hello   22  23.23   World   Abcd1234
    FOR  ${i}    IN     @{List1}
        Log to console      ${i}
    END

TC_004 Run Keyword
    ${Key_var} =    set variable    log to console
    run keyword     ${Key_var}      TestingWorldNoida@gmail.com

TC_005 Run Keyword If
    ${var} =    set variable    YES
    run keyword if  '${var}'=='YES'     log to console      Value Found
    run keyword If  '${var}'=='NO'      log to console      Value Not Found

TC_006 Set/Get Selenium Speed
    ${speed} =  get selenium speed
    log to console  ${speed}
    open Browser    ${URL}      ${Browser}  
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Set Selenium Speed 	 1 seconds
    Input Text      name:fld_username   Testing 
    Input Text      name:fld_email      testingworldindia@gmail.com
    Input Text      name:fld_password   abcd
    ${speed} =  get selenium speed
    log to console      ${speed}
    Close Browser

TC_007 Sleep
    open Browser    ${URL}      ${Browser}  
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    sleep   5 seconds
    Input Text      name:fld_username   Testing 
    Input Text      name:fld_email      testingworldindia@gmail.com
    Input Text      name:fld_password   abcd
    Close Browser


TC_007 Set/Get Timeout
    open Browser    ${URL}      ${Browser}  
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    set selenium timeout    10 seconds
    ${time} =   get selenium timeout
    log to console      ${time}
    Wait Until Page Contains 	 Testing
    Input Text      name:fld_username   Testing 
    Input Text      name:fld_email      testingworldindia@gmail.com
    Input Text      name:fld_password   abcd
    Close Browser


TC_008 Set/Get Selenium Implicit Wait
    open Browser    ${URL}      ${Browser}  
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    ${default_T} =      Get Selenium Implicit Wait
    log to console  ${default_T}
    Set Selenium Implicit Wait 	 10 seconds
    ${default_T} =      Get Selenium Implicit Wait
    log to console  ${default_T}
    Input Text      name:fld_username   Testing 
    Input Text      name:fld_email      testingworldindia@gmail.com
    Input Text      name:fld_password   abcd
    Close Browser




*** Keywords ***
