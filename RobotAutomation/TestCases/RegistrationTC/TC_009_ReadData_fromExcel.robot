*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Resources2.robot



*** Variables ***



*** Test Cases ***
Read Data From Excel 
    Start Browser and Maximize
    ${max_row}=    Read Number of Rows     Hello
    FOR     ${i}    IN RANGE    1   ${max_row}+1
        ${username}=    Read Excel Data of Cell    Hello   ${i}   1
        ${password}=    Read Excel Data of Cell    Hello   ${i}   2
        ${email}=    Read Excel Data of Cell    Hello   ${i}   3
        Input Text      name:fld_username       ${username}
        Input Text      name:fld_email          ${email}
        Input Text      name:fld_password       ${password}
        sleep           3seconds 
    END
    Close Browser Window

