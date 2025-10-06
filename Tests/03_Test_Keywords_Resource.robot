*** Settings ***
Documentation    Simple Robot Framework test setup
Resource         ../Resources/Functionality_Keywords/Example_Keywords.resource

Test Tags        demo

*** Variables ***
${NAME}          Marta Rakowska
@{FRIENDS_LIST}       Adam    Bartek    Celina
&{FRIENDS_DICT}  Adam=Friend    Bartek=Best Friend    Celina=Close Friend

*** Test Cases ***
TC1: Create Keyword To Print Your Name
    [Tags]    keyword_name
    Example_Keywords.Print My Name    Marta Rakowska

TC2: Create Keyword To Print Your Name With Default Argument
    [Tags]    keyword_name_default_argument
    Example_Keywords.Print My Name With Default

TC3: Create Keyword To Print Your FRIEND LIST
    [Tags]    keyword_friends_list
    Example_Keywords.Print My Friends List    @{FRIENDS_LIST}

TC4: Create Keyword To Print Str Variable And Your FRIEND LIST
    [Tags]    keyword_string_variable_and_friends_list
    Example_Keywords.Print Str Variable And Your FRIEND LIST    ${NAME}    @{FRIENDS_LIST}

TC5: Create Keyword To Print Str Variable With Default And Your FRIEND LIST
    [Tags]    keyword_string_variable_default_and_friends_list
    Example_Keywords.Print Str Variable With Default And Your FRIEND LIST    @{FRIENDS_LIST}

TC6: Create Keyword To Print Your FRIEND DICT
    [Tags]    keyword_friends_dict
    Example_Keywords.Print My Friends Dict    &{FRIENDS_DICT}

TC7: Create Keyword To Print Str Variable And Your FRIEND DICT
    [Tags]    keyword_string_variable_and_friends_dict
    Example_Keywords.Print Str Variable And Your FRIEND DICT    ${NAME}    &{FRIENDS_DICT}

TC8: Create Keyword To Print Str Variable With Default And Your FRIEND DICT
    [Tags]    keyword_string_variable_default_and_friends_dict
    Example_Keywords.Print Str Variable With Default And Your FRIEND DICT    &{FRIENDS_DICT}
