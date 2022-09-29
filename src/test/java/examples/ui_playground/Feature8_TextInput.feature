@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 8 - Text Input changing Button Text

        # Find an element using the id 'btn-primary'
    * def findButtonWithText =
    """
    "var button = document.querySelector('#updatingButton');"
    """

    # Get the attribute 'class'
    * def getClassAttribute =
    """
    "var text = button.innerText"
    """

    * def newButtonText = 'New Text'

    Given driver uitestingplaygroundUrl
    And click(playground.menuTextInput)
    And sleep(2000)
    * script(findButtonWithText)
    * script(getClassAttribute)
    * match script("text") contains 'Button That Should Change'
    And input(playground.caixaTextInput, newButtonText)
    And sleep(2000)
    And mouse().move(playground.buttonChangeBasedNameInput).click()
    * script(getClassAttribute)
    * match script("text") contains newButtonText
