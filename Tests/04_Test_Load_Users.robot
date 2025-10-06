*** Settings ***
Documentation    Simple Robot Framework test setup
Resource         ../Resources/Functionality_Keywords/Load_Users.resource

Test Tags        demo

*** Variables ***
${NAME}          Marta Rakowska
@{FRIENDS_LIST}       Adam    Bartek    Celina
&{FRIENDS_DICT}  Adam=Friend    Bartek=Best Friend    Celina=Close Friend

*** Test Cases ***
TC1: Create Keyword To Print Your Name
    [Tags]    keyword_name
    ${users}    Load_Users.Read Users From JSON File
    Log    ${users["users"][0]["Full Name"]}
