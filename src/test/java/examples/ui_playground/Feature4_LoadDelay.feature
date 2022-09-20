@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome' }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 4 - LoadDelay - Waiting for the Load Delay to find desired button

    Given driver "http://www.uitestingplayground.com/home"
    And click(playground.menuOptionLoadDelay)
    And waitFor(playground.buttonAppearingAfterDelay)
    And sleep(2000)
