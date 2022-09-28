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

    # Function to evaluate if the button element is clicked or not, using a flag attribute
    * def isClickedButton =
    """
    function isClicked() {
     if (button.getAttribute('wasclicked') === 'false') {
        button.setAttribute('wasclicked', 'true')
      } else {
        button.setAttribute('wasclicked', 'false')
     }
     }
    """

    # Find an element using the class attribute 'btn-primary'
    * def findButtonElement =
    """
    "var button = document.querySelector('.btn-primary');"
    """

    # Set an attribute 'wasClicked' with a specific value 'false'
    * def setButtonAttribute =
    """
    "button.setAttribute('wasclicked', 'false');"
    """

    # Add click event listener to a button
    * def addButtonEventListener =
    """
    "button.addEventListener('click', isClicked);"
    """

    # Gets the value from attribute 'wasClicked'
    * def getAttribute =
    """
    "button.getAttribute('wasclicked');"
    """


    #  --- [ Test Flow ] ----


    Given driver uitestingplaygroundUrl
    And click(playground.menuOptionClassAttribute)
    And sleep(1000)
    * script(changeAlertPopUp)
    * script(findButtonElement)
    * script(setButtonAttribute + isClickedButton)
    * script(addButtonEventListener)
    * assert script(getAttribute) == 'false'
    And click(playground.btnPrimaryButton)
    And sleep(2000)
    * dialog(false)
    * assert script(getAttribute) == 'true'


