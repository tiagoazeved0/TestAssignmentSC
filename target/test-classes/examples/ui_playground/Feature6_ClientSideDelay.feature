@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 6 - Client Side Delay

    Given driver "http://www.uitestingplayground.com/home"
    And click(playground.menuOptionClientSideDelay)
    And sleep(2000)
    And click(playground.buttonTriggeringClientSideDelay)
    And retry(10).waitFor(playground.textboxDataClientSideDelay)
    And sleep(1000)
