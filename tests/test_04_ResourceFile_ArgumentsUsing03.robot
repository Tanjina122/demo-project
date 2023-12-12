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

#Resource - we will define it in later lectures

*** Variables ***
${Login_Error_Mesage_Css}=    css:.alert-danger
${card_titiles}=                css:.card-title

*** Test Cases ***
Validate Successful Login and Product Titiles Are Displayed
    File The Login Form    ${user_name}    ${valid_Password}
    Wait Until The Product Tiles Is Shown    ${card_titiles}
    Verify Card Titiles With Expected List

*** Keywords ***
File The Login Form
    [Arguments]    ${username}   ${password}
                                #user name has come from resource file
    Input Text    id:username    ${username}
                                #passrod has come from resource file
    Input Text    id:password    ${password}
    Click Button    signInBtn

Wait Until The Product Tiles Is Shown
    [Arguments]    ${cardTitles}
    Wait Until Element Is Visible    ${cardTitles}

Verify Card Titiles With Expected List
    #Creating a List and storing in variables
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    
    #This variable stores the web elements.[When creating any List use "@" first and when we want
    #use that list use "$" first.
    ${elements}=    Get Webelements    css:.card-title
    @{actualList}    Create List
    #Declaring a FOR Loop "FOR    TAB${SingleVariable}    IN    TAB@{variablesList}    

    FOR    ${ele}    IN    @{elements}
        Log    ${ele.text}
            Append To List    ${actualList}    ${ele.text}
    END
    Lists Should Be Equal    ${actualList}    ${expectedList}