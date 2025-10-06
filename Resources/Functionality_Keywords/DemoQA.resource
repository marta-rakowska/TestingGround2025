*** Settings ***
Library          Collections
Library          String
Library          OperatingSystem
Library          json
Library          SeleniumLibrary

*** Keywords ***
Open Browser To DemoQA
    [Documentation]    Opens a browser and navigates to DemoQA website
    [Arguments]    ${browser}=chrome
    SeleniumLibrary.Open Browser    https://demoqa.com/    ${browser}

Close All Browsers
    [Documentation]    Closes all open browser instances
    SeleniumLibrary.Close All Browsers

Navigate To Elements Section
    [Documentation]    Navigates to the Elements section on DemoQA homepage
    SeleniumLibrary.Click Element    xpath=//h5[text()="Elements"]/ancestor::div[@class="card mt-4 top-card"]

Navigate To Text Box Section
    [Documentation]    Navigates to the Text Box section under Elements
    SeleniumLibrary.Click Element    xpath=//span[text()="Text Box"]

Fill Text Box Form
    [Documentation]    Fills the text box form with provided user data
    [Arguments]    &{user}
    SeleniumLibrary.Input Text    id=userName    ${user["Full Name"]}
    SeleniumLibrary.Input Text    id=userEmail    ${user["Email"]}
    SeleniumLibrary.Input Text    id=currentAddress    ${user["Current Address"]}
    SeleniumLibrary.Input Text    id=permanentAddress    ${user["Permanent Address"]}
    # SeleniumLibrary.Click Element    id=submit
    SeleniumLibrary.Execute JavaScript    window.scrollBy(0, 500)
    SeleniumLibrary.Execute JavaScript    document.getElementById('submit').click()