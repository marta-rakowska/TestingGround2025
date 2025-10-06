*** Settings ***
Library          DemoQADriverPackage
Library          DemoQADriverPackage.Elements
Library          DemoQADriverPackage.TextBox


*** Keywords ***
Open Browser And Navigate To Page
    DemoQADriverPackage.Open Browser
    DemoQADriverPackage.Navigate To Page
    
Close Browser
    DemoQADriverPackage.Close Browser

Elements: Navigate To Page
    DemoQADriverPackage.Elements.Navigate To Page

TextBox: Navigate To Page
    DemoQADriverPackage.TextBox.Navigate To Page

TextBox: Choose Parameters
    [Arguments]    @{params}
    DemoQADriverPackage.TextBox.Choose Parameters    @{params}
