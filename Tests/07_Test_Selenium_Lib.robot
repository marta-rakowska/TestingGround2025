*** Settings ***
Documentation    Simple Robot Framework test setup
Resource         ../Resources/Functionality_Keywords/Load_Users.resource
Resource         ../Resources/Functionality_Keywords/DemoQALib.resource

Test Tags        demo

*** Test Cases ***
TC1: Navigate To Text Box Section And Fill The Form Via Resource
    [Tags]    navigate_to_text_box_and_fill_form_via_resource
    ${users}    Load_Users.Read Users From JSON File
    @{flat_list}    Evaluate    [item for pair in ${users["users"][0]}.items() for item in pair]
    DemoQALib.Open Browser To DemoQA
    DemoQALib.Elements: Navigate To Page
    DemoQALib.TextBox: Navigate To Page
    DemoQALib.TextBox: Choose Parameters    @{flat_list}
    Sleep    2s
    [Teardown]    DemoQALib.Close Browser
