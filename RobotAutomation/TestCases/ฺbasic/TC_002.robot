*** Settings ***
Library     SeleniumLibrary
Library     Collections



*** Variables ***
${Browser}      Chrome
${URL}          http://www.thetestingworld.com/testings
${URL_thetestingworld}  https://www.thetestingworld.com/
${URL_google}   https://www.google.com/

*** Test Cases ***
TC_001 Take Screenshot at Runtime
    open Browser    ${URL}      ${Browser}  
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Input Text      name:fld_username   Testing 
    Input Text      name:fld_email      testingworldindia@gmail.com
    Input Text      name:fld_password   abcd
    Capture Page Screenshot 	 ../Snapshots/TC_002_1.png
    Close Browser

TC_002 Close all browser
    open Browser    ${URL}      ${Browser}  
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Input Text      name:fld_username   Testing 
    Input Text      name:fld_email      testingworldindia@gmail.com
    Input Text      name:fld_password   abcd
    open Browser    ${URL_google}      ${Browser}  
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Capture Page Screenshot 	 ../Snapshots/TC_002_2.png
    close all browsers

TC_003 Goto | Go Back | Get Location
    open Browser    ${URL_thetestingworld}      ${Browser}  
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    go to   ${URL_google}
    ${URL1} =   get location
    log to console  ${URL1}
    go back     
    ${URL1} =   get location
    log to console  ${URL1}
    Close Browser


TC_004 Execute JavaScript at Runtime => window.scrollTo(0, 1000)
    open Browser    ${URL_thetestingworld}      ${Browser}  
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Execute Javascript 	 window.scrollTo(0, 1000)
    sleep   5 seconds
    Close Browser


TC_005 Perform Mouse Operations | Open context menu => right click | double click elementv | Mouse down/up | Mouse over 
    open Browser    ${URL_thetestingworld}      ${Browser}  
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    # Open Context Menu 	 //span[contains(text(), 'VIDEOS')]

    # double click element    //a[text()='Quick Demo']

    # mouse down      //a[text()='Quick Demo']
    # mouse up        //a[text()='Quick Demo']
    mouse over      //span[contains(text(), 'VIDEOS')]
    sleep   5 seconds
    Close Browser

# TC_006 Perform Keyboard Operations | Key press with alph-numeric-special char | Key press with other keys 


# TC_007 Wait Keyword Commands



*** Keywords ***
