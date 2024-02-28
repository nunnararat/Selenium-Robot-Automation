*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}         https://thetestingworldapi.com/


*** Test Cases ***
Add new Data | Post Request | create new resource
    create session      AddData     ${base_url}
    &{body}=    create dictionary   first_name=Testing      middle_name=A       last_name=World      date_of_birth=12/12/1990
    ${response}=        POST On Session     AddData     api/studentsDetails     data=${body}    verify=${True} 

    # &{header}=  create dictionary   Content-Type=application/json
    # ${response}=        POST On Session     AddData     api/studentsDetails     data=${body}    headers=${header}    verify=${True}    

    ${actual_code}=     convert to string   ${response.status_code}
    should be equal     ${actual_code}      201




*** Keywords ***
