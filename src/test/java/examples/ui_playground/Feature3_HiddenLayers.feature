@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario Outline: UI Testing Playground - Feature 3 - HiddenLayers - Avoiding clicking the Green Button twice


    * def count = 0
    #
    * def findGreenButton =
    """
    "var greenButton = document.querySelector('#greenButton');"
    """

    #
    * def findBlueButton =
    """
    "var blueButton = document.querySelector('#blueButton');"
    """

    #
    * def setGreenButtonAttribute =
    """
    "greenButton.setAttribute('count', 1);"
    """

    #
    * def setBlueButtonAttribute =
    """
    "blueButton.setAttribute('count', 0);"
    """

    #
    * def addBlueButtonEventListener =
    """
    "blueButton.addEventListener('click', increaseBlue);"
    """

    #
    * def addGreenButtonEventListener =
    """
    "greenButton.addEventListener('click', increaseGreen);"
    """

    * def increaseBlue =
    """
    function increaseBlue(){
	blueButton.setAttribute('count', parseInt(blueButton.getAttribute('count')) + 1);
}
    """

    * def increaseGreen =
    """
	 function increaseGreen(){
	greenButton.setAttribute('count', parseInt(greenButton.getAttribute('count')) + 1);
}
    """

    * def getBlueAttributeValue =
    """
    "blueButton.getAttribute('count');"
    """

    * def getGreenAttributeValue =
    """
    "greenButton.getAttribute('count');"
    """


    Given driver uitestingplaygroundUrl
    And click(playground.menuOptionHiddenLayers)
    And sleep(2000)
    And click(playground.buttonGreenButton)
    And script(findGreenButton + findBlueButton + setGreenButtonAttribute + increaseGreen + setBlueButtonAttribute + increaseBlue + addBlueButtonEventListener + addGreenButtonEventListener)
    And sleep(2000)
    And script("blueButton.click()")
    And script("blueButton.click()")
    And script("blueButton.click()")
    And script("blueButton.click()")
    And script("blueButton.click()")
    Then match script(getBlueAttributeValue) == <times>
    Then match script(getGreenAttributeValue) == '1'


    Examples:
      | times |
      | '5'   |

