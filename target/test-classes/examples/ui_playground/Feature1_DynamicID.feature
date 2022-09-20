@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome' }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 1 - Dynamic ID - Clicking a button without recording its element by the Dynamic ID

    # Sleep added for viewing purposes of proper behaviour

    Given driver "http://www.uitestingplayground.com/home"

#    # A possible solution to create a flag to verify if button was clicked

#    * def booleanLogic =
#
#  """
#    var xpath = "//button[text()='Button with Dynamic ID']"
#    var matchingElement = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
#    matchingElement.setAttribute('wasClicked', 'false');
#
#    function isClicked() {
#     if (matchingElement.getAttribute('wasClicked') === 'false') {
#       matchingElement.setAttribute('wasClicked', 'true')
#      } else {
#        matchingElement.setAttribute('wasClicked', 'false')
#     }
#    }
#
#    matchingElement.addEventListener('click', isClicked);
#  """

    And click(playground.menuOptionDynamicId)
    * sleep(1000)
    And click(playground.buttonDynamicID)
    * sleep(1000)
