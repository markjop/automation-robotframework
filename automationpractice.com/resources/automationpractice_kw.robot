*** Settings ***
Library          SeleniumLibrary
Library          Dialogs
Library          String
Resource         ../../common/resources/helper_kw.robot    #TODO: assign paths (../../common/resources) in a var ${COMMON_RESOURCES}=../../../common
Resource         home_page.robot


*** Variables ***    #TODO: separate variables file
${BROWSER}=    chrome    #firefox | headlessfirefox | chrome | headlesschrome

*** Keywords ***
user has no account
    Element Should Contain    css:#header > div.nav > div > div > nav > div.header_user_info > a    Sign in
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
    ${item1}=    get text    css:#homefeatured > li:nth-child(1) > div > div.left-block > div > div.content_price > span
    ${item1}=    remove string    ${item1}    $
#    ${item1}=    convert to number    ${item1}
#    ${item1}=    convert to integer    ${item1}
    set test variable    ${item1}
    click "css:#homefeatured > li:nth-child(1) > div > div.right-block > div.button-container > a.button.ajax_add_to_cart_button.btn.btn-default > span"
    # user clicks continue shopping
    click "css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > span > span"
user selects item 2 and adds to cart and takes note the amount
    Scroll Element Into View    css:#homefeatured > li:nth-child(2) > div > div.left-block > div > a.product_img_link > img
    mouse over    css:#homefeatured > li:nth-child(2) > div > div.left-block > div > a.product_img_link > img
    ${item2}=    get text    css:#homefeatured > li:nth-child(2) > div > div.left-block > div > div.content_price > span
    ${item2}=    remove string    ${item2}    $
#    ${item2}=    convert to number    ${item2}
#    ${item2}=    convert to integer    ${item2}
    set test variable    ${item2}
    click "css:#homefeatured > li:nth-child(2) > div > div.right-block > div.button-container > a.button.ajax_add_to_cart_button.btn.btn-default > span"
    # note the total amount
    wait until element is visible    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div:nth-child(2) > span
    ${total}=    get text    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div:nth-child(2) > span
    ${total}=    remove string    ${total}    $
    set test variable    ${total}
two items are added in the cart
    wait until element is visible    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > h2 > span.ajax_cart_product_txt_s.unvisible
    element should contain    css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > h2 > span.ajax_cart_product_txt_s.unvisible    2

user proceeds to checkout
    click "css:#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a > span"

shopping cart summary is displayed
    wait until page contains    Shopping-cart summary
    page should contain    Shopping-cart summary

total product cost is correct
    ${final-item1}=    get text    css:#total_product_price_1_1_0
    ${final-item1}=    remove string    ${final-item1}    $
    ${final-item2}=    get text    css:#total_product_price_2_7_0
    ${final-item2}=    remove string    ${final-item2}    $
    ${final-total}=    get text    css:#total_product
    ${final-total}=    remove string    ${final-total}    $

    should be equal    ${item1}    ${final-item1}
    should be equal    ${item2}    ${final-item2}
    should be equal    ${total}    ${final-total}

