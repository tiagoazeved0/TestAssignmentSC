@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 4 - LoadDelay - Waiting for the Load Delay to find desired button

    Given driver uitestingplaygroundUrl
    And click(playground.menuOptionLoadDelay)
    And waitFor(playground.buttonAppearingAfterDelay)
    And sleep(2000)
