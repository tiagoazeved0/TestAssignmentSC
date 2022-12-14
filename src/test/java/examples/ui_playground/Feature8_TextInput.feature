@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 8 - Text Input changing Button Text

    * def newButtonText = 'New Text'

    Given driver uitestingplaygroundUrl
    And click(playground.menuTextInput)
    And sleep(2000)
    And input(playground.caixaTextInput, newButtonText)
    And sleep(2000)
    And mouse().move(playground.buttonChangeBasedNameInput).click()
    And sleep(2000)
