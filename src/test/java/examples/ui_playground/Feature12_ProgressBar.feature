@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 12 - Progress Bar

    * def percentageGoal = '75'
    * def progressBar = playground.progressBar

    Given driver "http://www.uitestingplayground.com/home"
    And click(playground.menuProgressBar)
    And sleep(3000)
    And mouse(playground.buttonStart).click()
    And waitFor('#progressBar').attribute('aria-valuenow')
    And sleep(5000)
    And click(playground.buttonStop)
    And sleep(10000)
