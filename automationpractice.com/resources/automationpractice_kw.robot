*** Settings ***
Library          SeleniumLibrary
Library          Dialogs
Library          String
Resource         ../../.common/resources/helper_kw.robot    #TODO refactor: consider using variables (../../.common/resources)
Resource         home_page.robot

*** Variables ***    #TODO: separate variables file
${BROWSER}=    chrome    #firefox | headlessfirefox | chrome | headlesschrome
${COMMON_RESOURCES}=    ../../common/resources

${sign-in Button}=    css:#header > div.nav > div > div > nav > div.header_user_info > a


*** Keywords ***
user has no account
    Element Should Contain    ${sign-in Button}    Sign in
user navigates to "${page-url}"
    go to "${page-url}"
homepage "${page-title}" is displayed
    verify "${page-title}"
user selects two (2) items and adds to cart and takes note the amount of each item
    user selects item 1 and adds to cart and takes note the amount
    user selects item 2 and adds to cart and takes note the amount

user selects item 1 and adds to cart and takes note the amount
#    Wait Until Element Is Visible    css:#homefeatured > li:nth-child(1) > div > div.left-block > div > a.product_img_link > img
#    Scroll Element Into View    css:#homefeatured > li:nth-child(1) > div > div.left-block > div > a.product_img_link > img
    Execute JavaScript    document.querySelector('#homefeatured > li:nth-child(1) > div > div.left-block > div > a.product_img_link > img').scrollIntoView(true)
    Mouse Over    css:#homefeatured > li:nth-child(1) > div > div.left-block > div > a.product_img_link > img
    ${item1}=    Get Text    css:#homefeatured > li:nth-child(1) > div > div.left-block > div > div.content_price > span
    ${item1}=    Remove String    ${item1}    $
#    ${item1}=    convert to number    ${item1}
#    ${item1}=    convert to integer    ${item1}
    Set Test Variable    ${item1}
    click "css:#homefeatured > li:nth-child(1) > div > div.right-block > div.button-container > a.button.ajax_add_to_cart_button.btn.btn-default > span"
    # user clicks continue shopping
    click "css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > span > span"
user selects item 2 and adds to cart and takes note the amount
    Scroll Element Into View    css:#homefeatured > li:nth-child(2) > div > div.left-block > div > a.product_img_link > img
    Mouse Over    css:#homefeatured > li:nth-child(2) > div > div.left-block > div > a.product_img_link > img
    ${item2}=    Get Text    css:#homefeatured > li:nth-child(2) > div > div.left-block > div > div.content_price > span
    ${item2}=    Remove String    ${item2}    $
#    ${item2}=    convert to number    ${item2}
#    ${item2}=    convert to integer    ${item2}
    Set Test Variable    ${item2}
    click "css:#homefeatured > li:nth-child(2) > div > div.right-block > div.button-container > a.button.ajax_add_to_cart_button.btn.btn-default > span"
    # note the total amount
    Wait Until Element Is Visible    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div:nth-child(2) > span
    ${total}=    Get Text    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div:nth-child(2) > span
    ${total}=    Remove String    ${total}    $
    Set Test Variable    ${total}
two items are added in the cart
    Wait Until Element Is Visible    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > h2 > span.ajax_cart_product_txt_s.unvisible
    Element Should Contain    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > h2 > span.ajax_cart_product_txt_s.unvisible    2

user proceeds to checkout
    click "css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a > span"

shopping cart summary is displayed
    Wait Until Page Contains    Shopping-cart summary
    Page Should Contain    Shopping-cart summary

total product cost is correct
    ${final-item1}=    Get Text    css:#total_product_price_1_1_0
    ${final-item1}=    Remove String    ${final-item1}    $
    ${final-item2}=    Get Text    css:#total_product_price_2_7_0
    ${final-item2}=    Remove String    ${final-item2}    $
    ${final-total}=    Get Text    css:#total_product
    ${final-total}=    Remove String    ${final-total}    $

    Should Be Equal    ${item1}    ${final-item1}
    Should Be Equal    ${item2}    ${final-item2}
    Should Be Equal    ${total}    ${final-total}

