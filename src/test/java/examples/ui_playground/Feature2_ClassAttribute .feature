@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 2 - Class Attribute - Clicking the blue button between 3 buttons that have same class

        # --- [ Scripts and Functions ] ----

    # Change Alert Text
    * def changeAlertPopUp =
    """
"window.actualAlert = window.alert; window.alert = function() { window.actualAlert('The blue button was pressed - btn-primary pressed!');}"
    """

    # Change Alert Text
    * def closePopUp =
    """
"var body = document.querySelector('body'); input(body, Key.ENTER);"
    """


    #  --- [ Test Flow ] ----


    Given driver uitestingplaygroundUrl
    And click(playground.menuOptionClassAttribute)
    And sleep(1000)
    * script(changeAlertPopUp)
    And click(playground.btnPrimaryButton)
    And sleep(3000)
#    * script(closePopUp)
    And sleep(10000)



