@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 1 - Dynamic ID - Clicking a button without recording its element by the Dynamic ID


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

    Given driver uitestingplaygroundUrl
    And click(playground.menuOptionDynamicId)
    * sleep(1000)
    * script(findButtonElement)
    * script(setButtonAttribute + isClickedButton)
    * script(addButtonEventListener)
    * assert script(getAttribute) == 'false'
    And click(playground.buttonDynamicID)
    * assert script(getAttribute) == 'true'

