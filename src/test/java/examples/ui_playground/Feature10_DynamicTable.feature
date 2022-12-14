@Playground
Feature: UI Testing Playground

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def playground = read('common.feature')
    * call playground

  Scenario: UI Testing Playground - Feature 10 - Finding specific value in a Dynamic Table

    Given driver uitestingplaygroundUrl
    And click(playground.menuDynamicTable)
    And sleep(2000)
    * def firstValue = text(playground.valueDynamicTableChromeCPUValue)
    * def secondValue = text(playground.valueChromeCPU)
    * match secondValue contains firstValue
