*** Settings ***
Documentation    Simple Robot Framework test setup
Resource         ../Resources/Functionality_Keywords/Load_Users.resource
Library          SeleniumLibrary

Test Tags        demo


*** Variables ***
${URL}          https://demoqa.com/

*** Test Cases ***
TC1: Open Browsers
    [Tags]    Open_Browser
    SeleniumLibrary.Open Browser    ${URL}    chrome
    # ${users}    Load_Users.Read Users From JSON File

TC2: Add Teardown To Close Browser
    [Tags]    Teardown
    SeleniumLibrary.Open Browser    ${URL}    chrome
    # ${users}    Load_Users.Read Users From JSON File
    [Teardown]    SeleniumLibrary.Close All Browsers

TC3: Move Open Browser To Test Setup
    [Tags]    setup_and_teardown
    [Setup]    SeleniumLibrary.Open Browser    ${URL}    chrome
    ${users}    Load_Users.Read Users From JSON File
    [Teardown]    SeleniumLibrary.Close All Browsers

TC4: Navigate To Elements Section
    [Tags]    navigate_to_elements
    [Setup]    SeleniumLibrary.Open Browser    ${URL}    chrome
    SeleniumLibrary.Click Element    xpath=//h5[text()="Elements"]/ancestor::div[@class="card mt-4 top-card"]
    Sleep    2s
    [Teardown]    SeleniumLibrary.Close All Browsers

TC5: Navigate To Text Box Section And Fill The Form
    [Tags]    navigate_to_text_box_and_fill_form
    [Setup]    SeleniumLibrary.Open Browser    ${URL}    chrome
    SeleniumLibrary.Maximize Browser Window
    ${users}    Load_Users.Read Users From JSON File
    SeleniumLibrary.Click Element    xpath=//h5[text()="Elements"]/ancestor::div[@class="card mt-4 top-card"]
    SeleniumLibrary.Click Element    xpath=//span[text()="Text Box"]
    SeleniumLibrary.Input Text    id=userName    ${users["users"][0]["Full Name"]}
    SeleniumLibrary.Input Text    id=userEmail    ${users["users"][0]["Email"]}
    SeleniumLibrary.Input Text    id=currentAddress    ${users["users"][0]["Current Address"]}
    SeleniumLibrary.Input Text    id=permanentAddress    ${users["users"][0]["Permanent Address"]}
    # SeleniumLibrary.Click Element    id=submit
    SeleniumLibrary.Execute JavaScript    window.scrollBy(0, 500)
    SeleniumLibrary.Execute JavaScript    document.getElementById('submit').click()
    Sleep    2s
    [Teardown]    SeleniumLibrary.Close All Browsers
