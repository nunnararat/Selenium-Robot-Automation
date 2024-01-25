*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${Browser}      Chrome
${URL}          http://www.thetestingworld.com/testings



*** Test Cases ***
# Robot Work on Textbox
#     Open Browser    ${URL}  ${Browser}
#     ...    options=add_experimental_option("detach", True)
#     Maximize Browser Window
#     Input Text      //input[@class='field' and @name='fld_username']  TestingWorld
#     Input Text      //input[@class='field' and @name='fld_email']   testingworldindia@gmail.com 
#     Clear Element Text 	 //input[@class='field' and @name='fld_username']
#     Close Browser


# Robot Work on Radio Button | Checkbox | Link
#     Open Browser    ${URL}  ${Browser}
#     ...    options=add_experimental_option("detach", True)
#     Maximize Browser Window
#     Select Radio Button 	 add_type 	 office
#     Select Checkbox 	 //form[select[@name='city']]/div[@class='btn']/input[@type='checkbox' and @name='terms']
#     Click Link 	 //a[text()='Read Detail']
#     Wait Until Element Is Visible   //*[@id="popup1"]/a   timeout=5s
#     Sleep   2s
#     Click Link 	 //*[@id="popup1"]/a
#     Close Browser


# Robot Work on List or Dropdown
#     Open Browser    ${URL}  ${Browser}
#     ...    options=add_experimental_option("detach", True)
#     Maximize Browser Window
#     # Set Selenium Speed 	 1seconds
#     Select From List By Index   //select[@name='sex']   2
#     Select From List By Value   //select[@name='sex']   1
#     Select From List By Label   //select[@name='sex']   Female
#     Close Browser


Robot Write Keywords in Test Case - With Argument | Without Argument
    Open Browser    ${URL}  ${Browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Enter Username Password Email   testing     testingworldindia@gmail.com     123456



*** Keywords ***
Enter Username Password Email
    [Arguments]     ${username}     ${email}    ${password}
    Input Text 	    name:fld_username   ${username}
    Input Text      name:fld_email      ${email}
    Input Text      name:fld_password   ${password}
    Close Browser