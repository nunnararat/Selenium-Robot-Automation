*** Settings ***
Library     SeleniumLibrary
Library     ../ExternalKeywords/UserKeywords.py   
Library     ../ExternalKeywords/Locators.py
Library     ../ExternalKeywords/ReadData.py



*** Variables ***
${Browser}      Chrome
${URL}          http://www.thetestingworld.com/testings


*** Keywords ***
Close Browser Window
    ${Title}=   Get Title
    Log     ${Title}
    Close Browser

Start Browser and Maximize
    [Documentation]     User defined Keyword without Argument
    Open Browser    ${URL}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window

Create Folder at Runtime
    [Arguments]     ${flodername}    ${subflodername}
    create_folder   ${flodername}
    create_sub_folder   ${subflodername}
    log     "Task Done Successfully"

Concatenate Username Password
    [Arguments]     ${username}     ${password}
    ${result}=      concatenate_two_values      ${username}     ${password}
    Log     ${result}

Read Element Locators
    [Arguments]       ${JsonPath}
    ${result}=      read_locator_from_json      ${JsonPath}
    RETURN      ${result}


Read Number of Rows
    [Arguments]     ${sheetname}
    ${max_row}=    fetch_number_of_rows    ${sheetname}
    RETURN  ${max_row}

Read Excel Data of Cell
    [Arguments]     ${sheetname}    ${row}      ${cell}
    ${cell_data}=   fetch_cell_data     ${sheetname}    ${row}   ${cell}
    RETURN      ${cell_data}