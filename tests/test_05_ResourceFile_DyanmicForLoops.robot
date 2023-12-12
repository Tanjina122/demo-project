*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
#This has come from resource.robot file
Test Setup    Open The Browser With The Rahul Shetty Url

#This has come from resource.robot file

#this is resource file which will be used throughout the test
Resource    resource.robot

#Resource - we will define it in later lectures

*** Variables ***
${Login_Error_Mesage_Css}=    css:.alert-danger
${card_titiles}=                css:.card-title

*** Test Cases ***
Validate Successful Login and Product Titiles Are Displayed
                           #This 2 arugments values are coming from resource.robot file
    File The Login Form    ${user_name}    ${valid_Password}
                                             #This value is cming from the "Varables"
    Wait Until The Product Tiles Is Shown    ${card_titiles}
    Verify Card Titiles With Expected List
    Select The Cart    Samsung Note 8

*** Keywords ***
File The Login Form

    [Arguments]    ${username}   ${password}
                                #this is indicating the arguments value in test case
    Input Text    id:username    ${username}
                                #this is indicating the arguments value in test case
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
    @{actualList}=    Create List    
    #Declaring a FOR Loop "FOR    TAB${SingleVariable}    IN    TAB@{variablesList}    
    FOR    ${ele}    IN    @{elements}
            # Just getting the test from each elements
            Log    ${ele.text}
            Append To List    ${actualList}    ${ele.text}
    END
    Lists Should Be Equal    ${actualList}    ${expectedList}

Select The Cart
    [Arguments]    ${clickTheCartProductNameButton}
    ${elements}=    Get WebElements    css:.card-title
    ${indexNumber}=    Set Variable    1
    FOR    ${ele}    IN        @{elements}
        Exit For Loop If    '${clickTheCartProductNameButton}' == '${ele.text}'
                                        #Here after indexNumber use space + space 1 (not tab)
        ${indexNumber}=    Evaluate    ${indexNumber} + 1
    END
    Click Button    xpath:(//*[@class ='card-footer'])[${indexNumber}]/button