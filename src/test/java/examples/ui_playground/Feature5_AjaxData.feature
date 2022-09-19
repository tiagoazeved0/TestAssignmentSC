Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome' }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 5 - AJAX Data - Loading data with AJAX request

    Given driver "http://www.uitestingplayground.com/home"
    And click(playground.menuOptionAjaxData)
    And sleep(2000)
    And click(playground.buttonTriggeringAJAXRequest)
    And retry(10).waitFor(playground.textboxDataLoadedAJAX)
    And sleep(1000)
