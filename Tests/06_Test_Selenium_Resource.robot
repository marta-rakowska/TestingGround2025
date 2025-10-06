*** Settings ***
Documentation    Simple Robot Framework test setup
Resource         ../Resources/Functionality_Keywords/Load_Users.resource
Resource         ../Resources/Functionality_Keywords/DemoQA.resource

Test Tags        demo

*** Test Cases ***
TC1: Navigate To Text Box Section And Fill The Form Via Resource
    [Tags]    navigate_to_text_box_and_fill_form_via_resource
    [Setup]    Open Browser To DemoQA    chrome
    ${users}    Load_Users.Read Users From JSON File
    Navigate To Elements Section
    Navigate To Text Box Section
    Fill Text Box Form    &{users["users"][0]}
    [Teardown]    Close All Browsers
