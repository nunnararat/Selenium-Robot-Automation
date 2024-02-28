*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}         https://thetestingworldapi.com/
${studentID}        10061205


*** Test Cases ***
Get Request
    create session      Get_Student_Details     ${base_url}
    ${response}=    GET On Session     Get_Student_Details     api/studentsDetails      verify=${True}
    Log To Console  ${response.status_code}
    Log To Console  ${response.content}

Fetch Student Details by id | Validate content using JSON Path
    create session      FetchData       ${base_url}
    ${response}=    GET On Session         FetchData       api/studentsDetails/${studentID}     verify=${True}
    ${actual_code}=    convert to string   ${response.status_code}   
    should be equal     ${actual_code}     200
    # ${json_res}=    to json     ${response.content}
    ${json_res}=        set variable    ${response.json()}   

    @{first_name_list}     get value from json    ${json_res}     data.first_name
    ${first_name}=    get from list   ${first_name_list}    0
    Log To Console  ${first_name}
    should be equal     ${first_name}   Kaikai

    @{last_name_list}   get value from json    ${json_res}     data.last_name
    ${last_name}=    get from list   ${last_name_list}    0
    Log To Console  ${last_name}
    should be equal     ${last_name}   Sesay


*** Keywords ***
