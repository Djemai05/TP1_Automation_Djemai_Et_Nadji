*** Settings ***
Library    SeleniumLibrary
Library    XML
Variables    ../Locators/Locators.py

*** Variables ***
${TIMEOUT}    3
*** Keywords ***
Open page
    [Documentation]    Ce Keyword sert a acceder a la page web a tester
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
    [Arguments]     ${vURL}    ${vBrowser}
    # Ouvrir le navigateur en precisant l'URL et le navigateur
    Open Browser    ${vURL}    ${vBrowser}
    # Maximiser la fenetre du navigateur
    Maximize Browser Window


Login
    [Documentation]    Ce Keyword sert a se connecter
    # vUsername contient le login
    # vPassword contient le mot de passe
    [Arguments]    ${vUsername}    ${vPassword}
    # Definir la valeur de timeout pour le cas de test
    Wait Until Element Is Enabled    ${txt_UserName}
    # Saisie du login
    Input Text    ${txt_UserName}    ${vUsername}
    # Saisie du mot de passe 
    Wait Until Element Is Enabled    ${txt_Password}    
    Input Password    ${txt_Password}    ${vPassword}
    Set Selenium Timeout    ${TIMEOUT}
    # Click sur le bouton Connexion
    Click Button   ${btn_Login}


Verify page URL & Contains
    [Documentation]    Ce Keyword sert a verifier qu'on est sur la bonne page
    [Arguments]    ${Attempted_URL}
    #URL_Loged_In: va contenir l'URL récupéré de la page 
    #Attempted_URL: contien l'URL Attendu
    #Recuperer l'URL de la nouvelle page
    ${URL_Loged_In}    Get Location
    #Afficher l'URL recuperer dans le rapport
    Log    URL de la page actuel:
    # S'assurer qu'on a atteint la bonne page en comparant son URL avec celui attendu
    Should Be Equal    ${URL_Loged_In}    ${Attempted_URL}
    # S'assurer qu'on a atteint la page attendue en verifiant le contenue
    Page Should Contain    Logged In Successfully


Verify Element    
    [Documentation]    Ce Keyword sert a verifier l'existence d'un élément
    [Arguments]    ${expected_Text}
    #expected_Text: contien le texte qui devrait se trouver sur l'élément
    #S'assuer que l'élément contien le texte de l'Élément recherché
    Element Should Contain    ${btn_Deconnexion_Locator}    ${expected_Text}
    #Verifier si l'élément est clickabl    
    Element Should Be Enabled    ${btn_Deconnexion_Locator}
    

Verify error message
    [Documentation]    Ce Keyword sert a verifier l'existence et le contenue d'un message d'erreure
    [Arguments]    ${error_Message_Locator}    ${Expected_Error_Message}
    #Expected_Error_Message: contien le texte du message d'erreur attendue
    #Attendre j'usqu'a l.élément soit visible
    Wait Until Element Is Visible    ${error_Message_Locator}
    #S'assuer que l'élément est visible
    Element Should Be Visible    ${error_Message_Locator}
    #S'assuer que l'élément contien le bon message
    Element Should Contain    ${error_Message_Locator}    ${Expected_Error_Message}


LogOut
    [Documentation]    Ce Keyword sert a se déconnecter a la page web
    Click Link    ${Btn_Deconnexion_Locator}
  
