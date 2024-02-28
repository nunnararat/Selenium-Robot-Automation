*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}         https://thetestingworldapi.com/
${studentID}        10061400

*** Test Cases ***
Update Data | Put Request
    create session      AddData     ${base_url}
    &{body}=    create dictionary   id=${studentID}   first_name=Testing      middle_name=ABC       last_name=World      date_of_birth=12/12/1990
    ${response}=        PUT On Session     AddData     api/studentsDetails/${studentID}     data=${body}    verify=${True} 
    ${actual_code}=     convert to string   ${response.status_code}
    should be equal     ${actual_code}      200

    ${recheck_response}     GET On Session       AddData       api/studentsDetails/${studentID}     verify=${True}
    Log To Console  ${recheck_response.content}




*** Keywords ***
