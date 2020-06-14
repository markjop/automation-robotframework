*** Variables ***
${BROWSER}=    chrome    #firefox | headlessfirefox | chrome | headlesschrome
${COMMON_RESOURCES}=    ../../common/resources    #TODO refactor: consider using variables (../../.common/resources)

${SignIn Button}=    css:#header > div.nav > div > div > nav > div.header_user_info > a
${SignOut Button}=    css:#header > div.nav > div > div > nav > div.header_user_info > a