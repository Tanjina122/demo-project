*** Settings ***
Documentation    this is a resouce file which we will use through our test

Library    SeleniumLibrary



*** Variables ***
${base_url}            https://rahulshettyacademy.com/loginpagePractise/#
${user_name}            rahulshettyacademy
${valid_Password}        learning
${invalid_Password}        wrongpassword
${ChromeBrowser}            Chrome


*** Keywords ***
Open The Browser With The Rahul Shetty Url
    Create Webdriver    Chrome
    # The "options" aruguments keep the browser open beacuse before using that one. It got closed
    #Automatically
    Open Browser    ${base_url}    ${ChromeBrowser}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    

    #Go To    ${base_url}

#Close Broswer Session
 #   Close Browser