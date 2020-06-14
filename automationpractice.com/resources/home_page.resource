*** Settings ***
Library          SeleniumLibrary
Library          Dialogs
Library          String
Resource         ../../.common/resources/helper_kw.robot
Resource         automationpractice_var.robot

*** Keywords ***
#@TODO: search for alternative way to remove Home Page.[keywords]
Guest Home Page Is Displayed
    verify "My Store" page
    Element Should Contain  ${SignIn Button}    Sign in

Authenticated Home Page is Displayed
    verify "My Store" page
    Element Should Contain  ${SignOut Button}    Sign Out

Hover number "${rank}" popular item
    Execute JavaScript    document.querySelector('#homefeatured > li:nth-child(${rank}) > div > div.left-block > div > a.product_img_link > img').scrollIntoView(true)
    Mouse Over    css:#homefeatured > li:nth-child(${rank}) > div > div.left-block > div > a.product_img_link > img

Get price of number "${rank}" popular item
    #@TODO: convert to get list
    Hover number "${rank}" popular item
    ${item_price}=    Get Text    css:#homefeatured > li:nth-child(${rank}) > div > div.left-block > div > div.content_price > span
    ${item_price}=    Remove String    ${item_price}    $
    Set Test Variable    ${item_price${rank}}    ${item_price}

Click Add to cart Button of number "${rank}" popular item
    click "css:#homefeatured > li:nth-child(${rank}) > div > div.right-block > div.button-container > a.button.ajax_add_to_cart_button.btn.btn-default > span"
           #blockbestsellers > li:nth-child(1) > div > div.right-block > div.button-container > a.button.ajax_add_to_cart_button.btn.btn-default > span