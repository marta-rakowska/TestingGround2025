*** Settings ***
Library    ${EXECDIR}${/}Libs${/}DemoQaDriver${/}demoqa.py
Library    ${EXECDIR}${/}Libs${/}DemoQaDriver${/}Elements${/}elements.py
Library    ${EXECDIR}${/}Libs${/}DemoQaDriver${/}Elements${/}textbox.py


*** Keywords ***
Open Browser To DemoQA
    [Documentation]    Opens a browser and navigates to DemoQA website
    demoqa.Open Browser
    demoqa.Navigate To Page

Close Browser
    [Documentation]    Closes all open browser instances
    demoqa.Close Browser


Elements: Navigate To Page
    [Documentation]    Navigates to the Elements section on DemoQA
    elements.Navigate To Page

TextBox: Navigate To Page
    [Documentation]    Navigates to the Text Box page under Elements
    textbox.Navigate To Page

TextBox: Choose Parameters
    [Arguments]    @{params_and_values}
    [Documentation]    Chooses parameters and fills values in the Text Box form
    textbox.Choose Parameters    @{params_and_values}