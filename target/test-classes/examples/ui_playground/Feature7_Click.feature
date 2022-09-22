@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 7 - Click button that is ignoring the DOM Click Event

    Given driver uitestingplaygroundUrl
    And click(playground.menuOptionClick)
    And sleep(2000)
    And mouse().move(playground.buttonIgnoresDOMClickEvent).click()
    And sleep(2000)
