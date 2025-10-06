*** Settings ***
Library          Collections
Library          String

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