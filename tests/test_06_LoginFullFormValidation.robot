*** Settings ***
Documentation    This code will show how to fill the form, radio button use select, pop alert handing

#                                    LECTURE 17 &1 8

Library    SeleniumLibrary
Library    Collections
Test Setup    Open The Browser With The Rahul Shetty Url
Resource    resource.robot

*** Variables ***
${UserNameFromThisFile}=        rahulshettyacademy
${UserPasswordFromThisFile}=        learning

*** Test Cases ***
Login Form With All The Details
    Fill The Login Details And Select User    ${UserNameFromThisFile}    ${UserPasswordFromThisFile}

*** Keywords ***
Fill The Login Details And Select User
    [Arguments]    ${user}    ${pass}
    Input Text    username    ${user}
    Input Text    password    ${pass}
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    okayBtn
    Click Element    xpath://button[@class='btn btn-success']
    Select From List By Value    css:select[class='form-control']    teach
    Select Checkbox    terms
    #It checks if the check box is selected or not
    Checkbox Should Be Selected    terms
    Click Button    signInBtn
