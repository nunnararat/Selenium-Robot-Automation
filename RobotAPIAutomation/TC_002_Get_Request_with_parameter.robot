*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}         https://reqres.in


*** Test Cases ***
# https://reqres.in/api/users?page=2
Validate Get Request with Parameters
    create session      Get_Param               ${base_url}
    &{param}            create dictionary       page=2
    ${response}=        GET On Session          Get_Param       api/users       params=${param}  
    ${actual_code}      convert to string       ${response.status_code}
    should be equal     ${actual_code}      200
    # ${json_res}=    to json     ${response.content}
    ${json_res}=        set variable    ${response.json()}    
    @{first_name_list}=    get value from json     ${json_res}     data[0].first_name
    ${name}=    get from list   ${first_name_list}  0
    should be equal     ${name}     Michael
    


*** Keywords ***
