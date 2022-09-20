@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 2 - Class Attribute - Clicking the blue button between 3 buttons that have same class

    # Sleep added for viewing purposes of proper behaviour

    Given driver "http://www.uitestingplayground.com/home"
    And click(playground.menuOptionClassAttribute)
    And sleep(2000)
    And click(playground.btnPrimaryButton)
    And sleep(2000)

