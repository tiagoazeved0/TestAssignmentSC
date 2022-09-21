@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 3 - HiddenLayers - Avoiding clicking the Green Button twice

    Given driver "http://www.uitestingplayground.com/home"
    And click(playground.menuOptionHiddenLayers)
    And sleep(2000)
    And click(playground.buttonGreenButton)
    And sleep(2000)
    And click(playground.buttonBlueButton)
    And sleep(2000)
