*** Settings ***
Library          SeleniumLibrary
Library          Dialogs
Library          String
Resource         home_page.resource
Resource         automationpractice_var.robot
Resource         ../../.common/resources/helper_kw.robot   #TODO: put it in page reference level

*** Keywords ***
User Has No Account    #TODO: randomize account details and creation
    Guest Home Page Is Displayed
user navigates to "${page-url}"
    go to "${page-url}"
homepage is displayed
    verify "My Store" page
user selects two (2) items and adds to cart and takes note the amount of each item
    user selects item "1" and adds to cart and takes note the amount
    user selects item "2" and adds to cart and takes note the amount

user selects item "${rank}" and adds to cart and takes note the amount
    Get price of number "${rank}" popular item
    Click Add to cart Button of number "${rank}" popular item

    # note the total amount
    Wait Until Element Is Visible    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div:nth-child(2) > span
    ${total}=    Get Text    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div:nth-child(2) > span
    ${total}=    Remove String    ${total}    $
    Set Test Variable    ${total}

    # user clicks continue shopping
    click "css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > span > span"

two items are added in the cart
#    Wait Until Element Is Visible    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > h2 > span.ajax_cart_product_txt_s.unvisible
#    Element Should Contain    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > h2 > span.ajax_cart_product_txt_s.unvisible    2
    no operation

user proceeds to checkout
    Execute JavaScript    document.querySelector('#header > div:nth-child(3) > div > div > div:nth-child(3) > div > a').scrollIntoView(true)
    click "css:#header > div:nth-child(3) > div > div > div:nth-child(3) > div > a"

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

    Should Be Equal    ${item_price1}    ${final-item1}
    Should Be Equal    ${item_price2}    ${final-item2}
    Should Be Equal    ${total}    ${final-total}

