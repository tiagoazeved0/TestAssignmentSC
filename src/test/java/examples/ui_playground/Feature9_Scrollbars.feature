@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 9 - Scroll Bars And Hiding Button

    Given driver uitestingplaygroundUrl
    And click(playground.menuScrollbars)
    And sleep(2000)
    And click(playground.caixaScroll)
    And sleep(2000)
    And scroll(playground.hidingButton)
    And sleep(1000)
    And mouse().move(playground.hidingButton).click()
    And sleep(2000)
