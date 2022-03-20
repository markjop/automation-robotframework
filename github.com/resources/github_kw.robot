*** Keywords ***
I want repositories coded in "${search_key}"
    Set Test Variable    ${search_key}
I search Github
    go to "https://github.com/"
    enter "${search_key}" in "css:input[placeholder='Search GitHub']"
    click "css:a[data-target-type="Search"]"
I should see some repositories coded in "${search_key}"
    ${count}=   get element count   css:a[title="Topic: javascript"]
    should be true  ${count}>1
