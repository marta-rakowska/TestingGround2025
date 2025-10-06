*** Settings ***
Documentation    Simple Robot Framework test setup
Library          Collections
Library          String

Test Tags        demo

*** Variables ***
${NAME}          Marta Rakowska
@{FRIENDS_LIST}       Adam    Bartek    Celina
&{FRIENDS_DICT}  Adam=Friend    Bartek=Best Friend    Celina=Close Friend

*** Test Cases ***
TC1: Create Keyword To Print Your Name
    [Tags]    keyword_name
    Print My Name    Marta Rakowska

TC2: Create Keyword To Print Your Name With Default Argument
    [Tags]    keyword_name_default_argument
    Print My Name With Default    Klara Kowalska

TC3: Create Keyword To Print Your FRIEND LIST
    [Tags]    keyword_friends_list
    Print My Friends List    @{FRIENDS_LIST}

TC4: Create Keyword To Print Str Variable And Your FRIEND LIST
    [Tags]    keyword_string_variable_and_friends_list
    Print Str Variable And Your FRIEND LIST    ${NAME}    @{FRIENDS_LIST}

TC5: Create Keyword To Print Str Variable With Default And Your FRIEND LIST
    [Tags]    keyword_string_variable_default_and_friends_list
    Print Str Variable With Default And Your FRIEND LIST    @{FRIENDS_LIST}

TC6: Create Keyword To Print Your FRIEND DICT
    [Tags]    keyword_friends_dict
    Print My Friends Dict    &{FRIENDS_DICT}

TC7: Create Keyword To Print Str Variable And Your FRIEND DICT
    [Tags]    keyword_string_variable_and_friends_dict
    Print Str Variable And Your FRIEND DICT    ${NAME}    &{FRIENDS_DICT}

TC8: Create Keyword To Print Str Variable With Default And Your FRIEND DICT
    [Tags]    keyword_string_variable_default_and_friends_dict
    Print Str Variable With Default And Your FRIEND DICT    &{FRIENDS_DICT}


*** Keywords ***
Print My Name
    [Arguments]    ${name}
    Log    ${name}

Print My Name With Default
    [Arguments]    ${name}=Marta Rakowska
    Log    ${name}

Print My Friends List
    [Arguments]    @{friends}
    FOR    ${friend}    IN    @{friends}
        Log    ${friend}
    END

Print Str Variable And Your FRIEND LIST
    [Arguments]    ${name}    @{friends}
    Log    Name: ${name}
    FOR    ${friend}    IN    @{friends}
        Log    Friend: ${friend}
    END

Print Str Variable With Default And Your FRIEND LIST
    [Arguments]    ${name}=Marta Rakowska    @{friends}
    Log    Name: ${name}
    FOR    ${friend}    IN    @{friends}
        Log    Friend: ${friend}
    END

Print My Friends Dict
    [Arguments]    &{friends_dict}
    FOR    ${key}    ${value}    IN    &{friends_dict}
        Log    ${key}: ${value}
    END

Print Str Variable And Your FRIEND DICT
    [Arguments]    ${name}    &{friends_dict}
    Log    Name: ${name}
    FOR    ${key}    ${value}    IN    &{friends_dict}
        Log    ${key}: ${value}
    END

Print Str Variable With Default And Your FRIEND DICT
    [Arguments]    ${name}=Marta Rakowska    &{friends_dict}
    Log    Name: ${name}
    FOR    ${key}    ${value}    IN    &{friends_dict}
        Log    ${key}: ${value}
    END
