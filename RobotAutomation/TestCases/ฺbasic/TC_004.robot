*** Settings ***
Library     SeleniumLibrary



*** Variables ***
${Browser}      Chrome
${URL}          http://www.thetestingworld.com/testings
${URL_thetestingworld}  https://www.thetestingworld.com/
${URL_google}   https://www.google.com/
${URL_robot}    https://robotframework.org/
${URL_checkbox}     https://bootstrap-vue.org/docs/components/form-checkbox


*** Test Cases ***
# Validations in Robot Framework
TC_001 Page Contains & Page should not Contains
    Open Browser    ${URL_thetestingworld}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    page should contain     VIDEOS
    # page should not contain     VIDEOS11
    click element   //a[text()='Quick Demo']
    Close Browser


TC_002 Page should contains element
    Open Browser    ${URL_thetestingworld}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    click element   //a[text()='Quick Demo']
    page should contain textfield       name:wdform_1_element_first2
    # page should not contain textfield       name:username
    input text      name:wdform_1_element_first2    banana
    Close Browser

TC_003 Validate Checkbox
    Open Browser    ${URL_checkbox}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    # select checkbox     //*[@id="checkbox-1"]
    Click Element   //label[@for='checkbox-1']
    checkbox should be selected     //*[@id="checkbox-1"]
    click element   //label[@for='checkbox-1']
    checkbox should not be selected     //*[@id="checkbox-1"]
    Close Browser

TC_004 Validate Element Text => should be | should not be
    Open Browser    ${URL}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    element text should be      //*[@id="tab-content1"]/p      Register now and kick start your career as a Software Testing Pro!
    element text should not be      //*[@id="tab-content1"]/p      Welcome
    input text      name:fld_username   hello
    Close Browser

TC_005 Validate Element Text => should contain | should contain
    Open Browser    ${URL}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    element should contain      //*[@id="tab-content1"]/p      kick start your career 
    # element should not contain      //*[@id="tab-content1"]/p      kick start your career    # Fail   because it should be there :)
    input text      name:fld_username   hello
    Close Browser

TC_006 Validate => Title | Element Enable | Visible
    Open Browser    ${URL}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    title should be       Login & Sign Up Forms   
    element should be enabled   name:fld_username   
    # element should be disabled   name:fld_username   
    # element should be visible    name:fld_username   
    # element should not be visible    name:fld_username   
    Close Browser

*** Keywords ***