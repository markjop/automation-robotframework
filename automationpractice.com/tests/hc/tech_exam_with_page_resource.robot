*** Settings ***
Documentation    Automation Tests Hands On
...              #robot --outputdir automationpractice.com/tests/hc/results/`date +%Y%m%d-%s` --variable BROWSER:headlesschrome automationpractice.com/tests/hc/tech_exam_with_page_resource.robot
#Library          SeleniumLibrary
Resource         ../../resources/automationpractice_kw.robot
Suite Setup      Open Browser    http://automationpractice.com/    ${BROWSER}
Test Teardown    Run Keywords    Capture Page Screenshot
...              AND             Close Browser
Suite Teardown    Close Browser

*** Test Cases ***
Scenario: Add to cart and validate
    [Tags]    DemoTest101
    [Documentation]     Test Description:   Add two items in the cart and validate |
    ...                 Expected Result:    Total product cost is correct
    Given user has no account
    When user navigates to "http://automationpractice.com/"
        Then homepage is displayed
    When user selects two (2) items and adds to cart and takes note the amount of each item
        Then two items are added in the cart
    When user proceeds to checkout
        Then shopping cart summary is displayed
        And total product cost is correct
#        log variables


#DemoTest102
#    [Tags]    DemoTest102
#    [Documentation]    Test Description:    Add items in cart and complete payment transaction |
#    ...                Expected Result:     Total amount and ordered summary amount are the same.

#DemoTest103
#    [Tags]    DemoTest103
#    [Documentation]    Test Description:    Add items in cart and complete payment transaction |
#    ...                Expected Result:     Reference number is displayed
