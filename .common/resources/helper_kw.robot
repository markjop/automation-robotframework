*** Settings ***
Documentation     This is the helper keywords file for using
...               common-used commands from SeleniumLibrary
...               (http://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
Library           SeleniumLibrary

*** Keywords ***
go to "${page-url}"
    [Documentation]    GO TO the *web-page-url* and Maximize the browser window
    Go To    ${page-url}
    Set Window Size  1420  1290    #1024    768
    Set Selenium Speed    0.2
#    Maximize Browser Window    #for windows only

verify "${page-title}"
    [Documentation]    SELECT the opened browser with the *title*
    Switch Window       ${page-title}
    Title Should Be     ${page-title}

click "${element}"
    [Documentation]    WAIT for an *element* to be visible then CLICK it.
    ...    *Element* could be a button, a text field, a checkbox, or a select box
    Wait Until Element Is Visible    ${element}
    Scroll Element Into View         ${element}
    Set Focus To Element             ${element}
    Mouse Down                       ${element}
    Click Element                    ${element}

enter "${text}" in "${input-text-field}"
    [Documentation]    ENTER the desired *value* on a text field
    click "${input-text-field}"
    Input Text    ${input-text-field}    ${text}

select "${option}" from "${select-field}"
    [Documentation]    SELECT the desired *value* on a select field
    click "${select-field}"
    Select From List    ${select-field}    ${option}

scroll to bottom of the page
    [Documentation]    Scrolls to the bottom of the page
    Execute JavaScript    window.scrollTo(0,document.body.scrollHeight)




## @todo update
#Verify Element Should Be Visible
#    [Documentation]    Verifies that the *element* is visible
#    [Arguments]    ${element}
#    Wait Until Element Is Visible    ${element}
#    Element Should Be Visible    ${element}
#
#Verify Element Should Not Be Visible
#    [Documentation]    Verifies that the *element* is not visible
#    [Arguments]    ${element}
#    Wait Until Element Is Not Visible    ${element}
#    Element Should Not Be Visible    ${element}
#
#
#
#
## @todo update deprecated keywords
#Wait and Click Element
#    [Documentation]    WAIT for an *element* to be visible then CLICK it.
#    ...    *Element* could be an a button, a text field, a checkbox, or a select box
#    [Arguments]    ${element}
#    Wait Until Element Is Visible    ${element}
#    Focus    ${element}
#    Mouse Down    ${element}
#    Click Element    ${element}
#
#Enter Text
#    [Documentation]    ENTER the desired *value* on a text field
#    [Arguments]    ${text}    ${input-text-field}
#    Wait and Click Element    ${input-text-field}
#    Input Text    ${input-text-field}    ${text}
#
#Select Option
#    [Documentation]    SELECT the desired *value* on a select field
#    [Arguments]    ${option}    ${select-field}
#    Wait and Click Element    ${select-field}
#    Select From List    ${select-field}    ${option}
## to be deprecated keywords #