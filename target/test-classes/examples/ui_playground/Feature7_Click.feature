@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

#    * def windowName = 'UI Test Automation Playground'

  Scenario: UI Testing Playground - Feature 7 - Click

#    * robot { window: '#(windowName)'}
    Given driver "http://www.uitestingplayground.com/home"
    And click(playground.menuOptionClick)
    And sleep(2000)
    And mouse().move(playground.buttonIgnoresDOMClickEvent).click()
    And sleep(1000)
