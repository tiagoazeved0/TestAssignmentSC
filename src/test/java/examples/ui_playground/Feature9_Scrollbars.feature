@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome' }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 9 - Scroll Bars

    * def newButtonText = 'WeWe'
    Given driver "http://www.uitestingplayground.com/home"
    And click(playground.menuScrollbars)
    And sleep(2000)
    And click(playground.caixaScroll)
    And sleep(2000)
    And scroll(playground.hidingButton)
    And sleep(1000)
    And mouse().move(playground.hidingButton).click()
    And sleep(2000)
