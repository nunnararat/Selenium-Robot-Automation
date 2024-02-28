*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections


*** Variables ***
${base_url}         https://thetestingworldapi.com/



*** Test Cases***
TC_001 Add new Data | POST On Session
    [Arguments]     ${original_first_name}
    create session      AddData     ${base_url}
    &{body}=    create dictionary   first_name=${original_first_name}      middle_name=A       last_name=World      date_of_birth=12/12/1990
    ${response}=        POST On Session     AddData     api/studentsDetails     data=${body}    verify=${True} 
    ${actual_code}=     convert to string   ${response.status_code}
    should be equal     ${actual_code}      201
    ${json_res}=    set variable    ${response.json()}
    @{id_list}=     get value from json     ${json_res}     id
    log to console  ${id_list}
    ${id}=      get from list   ${id_list}  0
    Set Global Variable    ${global_variable_id}    ${id}


TC_002 Update Data | PUT On Session
    create session      UpdateData     ${base_url}
    &{body}=    create dictionary   id=${global_variable_id}   first_name=${update_first_name}      middle_name=A       last_name=World      date_of_birth=12/12/1990
    ${response}=        PUT On Session     UpdateData     api/studentsDetails/${global_variable_id}     data=${body}    verify=${True} 
    ${actual_code}=     convert to string   ${response.status_code}
    should be equal     ${actual_code}      200
    ${recheck_response}     GET On Session       UpdateData       api/studentsDetails/${global_variable_id}     verify=${True}
    Log To Console  ${recheck_response.content}


TC_003 Fetch Student Details by id | Validate content using JSON Path
    create session      FetchData       ${base_url}
    ${response}=    GET On Session         FetchData       api/studentsDetails/${global_variable_id}     verify=${True}
    ${actual_code}=    convert to string   ${response.status_code}   
    should be equal     ${actual_code}     200
    ${json_res}=        set variable    ${response.json()}   

    @{first_name_list}     get value from json    ${json_res}     data.first_name
    ${first_name}=    get from list   ${first_name_list}    0
    Log To Console  ${first_name}
    should be equal     ${first_name}   Testing

TC_004 Delete Data | Validate Delete Request 
    create session      AppAccess       ${base_url}
    ${response}=    DELETE On Session      AppAccess     api/studentsDetails/${global_variable_id}       verify=${True}
    ${actual_code}      convert to string       ${response.status_code}
    should be equal     ${actual_code}      200
    ${json_res}=    set variable    ${response.json()}
    Log To Console  ${json_res}
    @{status_list}=     get value from json     ${json_res}     status
    ${status}=      get from list       ${status_list}    0
    should be equal     ${status}    true  
