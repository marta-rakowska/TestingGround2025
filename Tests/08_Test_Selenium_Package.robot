*** Settings ***
Documentation    Simple Robot Framework test setup
Resource         ../Resources/Functionality_Keywords/Load_Users.resource
Resource         ../Resources/Functionality_Keywords/FK_DemoQAPackage.resource

Test Tags        demo

*** Test Cases ***
TC1: Navigate To Text Box Section And Fill The Form Via Resource
    [Tags]    navigate_to_text_box_and_fill_form_via_package
    ${users}    Load_Users.Read Users From JSON File
    @{flat_list}    Evaluate    [item for pair in ${users["users"][0]}.items() for item in pair]    
    FK_DemoQAPackage.Open Browser And Navigate To Page
    FK_DemoQAPackage.Elements: Navigate To Page
    FK_DemoQAPackage.TextBox: Navigate To Page
    FK_DemoQAPackage.TextBox: Choose Parameters    @{flat_list}
    [Teardown]    FK_DemoQAPackage.Close Browser
