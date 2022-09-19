Feature: Common Behaviours for Different features

  Background:
    * configure driver = { type: 'chrome' }

  Scenario: Locators Json Call

    * call read 'locators.json'
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }