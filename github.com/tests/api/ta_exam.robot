*** Settings ***
Documentation    Automation Tests Hands On (API)
...              # sample run cmd: robot --outputdir github.com/tests/api/results/`date +%Y%m%d-%s` --variable BROWSER:chrome github.com/tests/api/ta_exam.robot
Library          RequestsLibrary
Library          JSONLibrary

*** Test Cases ***
Quick Get Request Test
    ${response}=    GET  https://api.github.com

Quick Get Request With Parameters Test
    ${response}=    GET  https://api.github.com/search/repositories  params=q=tetris+language:assembly&sort=stars&order=desc  expected_status=200

Quick Get A JSON Body Test
    ${response}=    GET  https://api.github.com/search/repositories  params=q=tetris+language:assembly&sort=stars&order=desc
    should be equal as strings  False   ${response.json()}[incomplete_results]