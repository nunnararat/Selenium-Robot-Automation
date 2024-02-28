*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}         https://thetestingworldapi.com/
${studentID}        10061223

*** Test Cases ***

Get Request
    create session      Get_Student_Details     ${base_url}
    ${response}=    GET On Session     Get_Student_Details     api/studentsDetails      verify=${True}
    Log To Console  ${response.status_code}
    Log To Console  ${response.content}


Delete Data | Validate Delete Request 
    create session      AppAccess       ${base_url}
    ${response}=    DELETE On Session      AppAccess     api/studentsDetails/${studentID}       verify=${True}
    ${actual_code}      convert to string       ${response.status_code}
    should be equal     ${actual_code}      200
    ${json_res}=    set variable    ${response.json()}
    Log To Console  ${json_res}
    @{status_list}=     get value from json     ${json_res}     status
    ${status}=      get from list       ${status_list}    0
    should be equal     ${status}    true  



    


*** Keywords ***
