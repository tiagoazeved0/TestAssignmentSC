@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 11 - Verify Text

    * def welcomeText = 'Welcome'

    Given driver "http://www.uitestingplayground.com/home"
    And click(playground.menuVerifyText)
    And sleep(2000)
    * match text(playground.textVerifyText) contains welcomeText
