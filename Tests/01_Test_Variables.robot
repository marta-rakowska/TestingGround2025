*** Settings ***
Documentation    Simple Robot Framework test setup
Library          Collections
Library          String

Test Tags    demo

*** Variables ***
${NAME}    Marta Rakowska
@{FRIENDS_LIST}    Adam    Bartek    Celina
&{FRIENDS_DICT}    Adam=Friend      Bartek=Best Friend    Celina=Close Friend

*** Test Cases ***
TC1: Print Your Name
    [Tags]    name
    Log    Marta Rakowska
    
TC2: Set Your Name As Variable Then Print It
    [Tags]    name_variable
    ${name}=    Set Variable    Marta Rakowska
    Log    ${name}
    
TC3: Move Your Name To Variable Section Then Print It
    [Tags]    name_variable_section
    Log    ${NAME}
    
TC4: Create List Of Your Friends And Print It
    [Tags]    friends_list
    @{friends}    Create List    Adam    Bartek    Celina
    Log    ${friends}
    
TC5: Move Your Friends List To Variables Section Then Print It
    [Tags]    friends_list_variable_section
    Log    ${FRIENDS_LIST}
    
TC6: Print Your Friends One By One
    [Tags]    friends_list_one_by_one
    FOR    ${friend}    IN    @{FRIENDS_LIST}
        Log    ${friend}
    END
    
TC7: Create Dictionary Of Your Friends And Print It
    [Tags]    friends_dict
    &{friends_dict}    Create Dictionary    Adam=Friend      Bartek=Best Friend    Celina=Close Friend
    Log    ${friends_dict}
    
TC8: Move Your Friends Dictionary To Variables Section Then Print It
    [Tags]    friends_dict_variable_section
    Log    ${FRIENDS_DICT}

TC9: Print Your Friends From Dictionary One By One
    [Tags]    friends_dict_one_by_one
    FOR    ${name}    IN    @{FRIENDS_DICT.keys()}
        Log    ${name}: ${FRIENDS_DICT["${name}"]}
        Log    ${name}: ${FRIENDS_DICT}[${name}]
    END

    FOR    ${key}    ${value}    IN    &{FRIENDS_DICT}
        Log    ${key}: ${value}
    END
