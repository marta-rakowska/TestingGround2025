*** Settings ***
Library          OperatingSystem
Library          json

*** Variables ***
${PATH}        ${EXECDIR}/Data/users.json


*** Keywords ***
Read Users From JSON File
    [Documentation]    Reads user data from JSON file and returns parsed data
    ${content}    Get File    ${PATH}
    ${users}    Evaluate    json.loads('''${content}''')    json
    RETURN    ${users}