*** Settings ***
Documentation    Automation Tests Hands On (UI)
...              # sample run cmd: robot --outputdir github.com/tests/ui/results/`date +%Y%m%d-%s` --variable BROWSER:chrome github.com/tests/ui/ta_exam.robot
Resource         ../../resources/github_kw.robot
Suite Setup      Open Browser    http://google.com/    ${BROWSER}
Test Teardown    Run Keywords    Capture Page Screenshot
...              AND             Close Browser
Suite Teardown    Close Browser

*** Test Cases ***
Scenario: Search for javascript projects
    [Tags]    UI Automation
    [Documentation]     Test Description:   Search for repositories with "javascript" on Github |
    ...                 Expected Result:    job
    Given I want repositories coded in "javascript"
    When I search Github
    Then I should see some repositories coded in "javascript"
