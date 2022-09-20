Feature: Store DELETE Features

  Background:
    * url 'https://petstore.swagger.io/v2/'

  Scenario: Delete an existing Order Id using DELETE request

    * def orderId = '2209180275'

    Given path 'store','order',orderId
    When method delete
    Then status 200

    * string stringOrderId = orderId

    * match response.code == 200
    * match response.type == 'unknown'
    * match response.message == stringOrderId


