@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome' }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 8 - Text Input

    * def newButtonText = 'WeWe'
    Given driver "http://www.uitestingplayground.com/home"
    And click(playground.menuTextInput)
    And sleep(2000)
    And input(playground.caixaTextInput, newButtonText)
    And sleep(2000)
    And mouse().move(playground.buttonChangeBasedNameInput).click()
    And sleep(2000)
