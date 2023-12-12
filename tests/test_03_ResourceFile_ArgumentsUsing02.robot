*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
#This has come from resource.robot file
Test Setup    Open The Browser With The Rahul Shetty Url

#This has come from resource.robot file
#Test Teardown    Close Broswer Session

#this is resource file which will be used throughout the test
Resource    resource.robot

*** Variables ***
${Login_Error_Mesage_Css}=    css:.alert-danger
${card_Titiles}=                css:.card-title

*** Test Cases ***
Validate Unsuccessful Login
    File The Login Form    ${user_name}    ${invalid_Password}
    Wait Until It Checks And Display Error Message
    Verify Error Message Is Correct
Validate Successful Login and Product Titiles Are Displayed
    File The Login Form    ${user_name}    ${valid_Password}
    Wait Until The Product Tiles Is Shown    ${card_Titiles}
    Verify Card Titiles With Expected List

*** Keywords ***
File The Login Form
    [Arguments]    ${username}   ${password}
                                #user name has come from resource file
    Input Text    id:username    ${username}
                                #passrod has come from resource file
    Input Text    id:password    ${password}
    Click Button    signInBtn

Wait Until It Checks And Display Error Message
    Wait Until Element Is Visible    ${Login_Error_Mesage_Css}


Verify Error Message Is Correct
    ${errorMessage}=    Get Text    css:.alert-danger
    Should Be Equal As Strings   ${errorMessage}     Incorrect username/password.
    #Below code is giving the same comparison but in selenium framework
    Element Text Should Be    ${Login_Error_Mesage_Css}    Incorrect username/password.
Wait Until The Product Tiles Is Shown
    [Arguments]    ${cardTitles}
    Wait Until Element Is Visible    ${cardTitles}

Verify Card Titiles With Expected List
    #Creating a List and storing in variables
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    
    #This variable stores the web elements.[When creating any List use "@" first and when we want
    #use that list use "$" first.
    ${elements} =    Get Webelements    css:.card-title
    @{actualList}=    Create List    
    #Declaring a FOR Loop "FOR    TAB${SingleVariable}    IN    TAB@{variablesList}    
    FOR    ${element}    IN    @{elements}
            # Just getting the test from each elements
            Log    ${element.text}
            Append To List    ${actualList}    ${element.text}
            
    END
    Lists Should Be Equal    ${actualList}    ${expectedList}