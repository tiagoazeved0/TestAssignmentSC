@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 7 - Click button that is ignoring the DOM Click Event

    # Find an element using the id 'btn-primary'
    * def findButton =
    """
    "var button = document.querySelector('#badButton');"
    """

    # Get the attribute 'class'
    * def getClassAttribute =
    """
    "var text = button.getAttribute('class');"
    """

    Given driver uitestingplaygroundUrl
    And click(playground.menuOptionClick)
    And sleep(2000)
    * script(findButton)
    * script(getClassAttribute)
    * match script("text") contains 'btn-primary'
    And mouse().move(playground.buttonIgnoresDOMClickEvent).click()
    * script(findButton)
    * script(getClassAttribute)
    * match script("text") contains 'btn-success'
