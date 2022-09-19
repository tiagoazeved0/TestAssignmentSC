Feature: Store GET Features

  Background:
    * url 'https://petstore.swagger.io/v2/'

  Scenario: Get Purchase Order By orderId

    # GET - Get Purchase Order By orderId

    * def orderId = '2209180269'

    Given path 'store', 'order', orderId
    When method get
    Then status 200

    * print response
    * match response.id == '#(parseInt(orderId))'
    * match response.complete == true


  Scenario: Returns Pet Inventories by status

    # GET - Returns Pet Inventories by status

    Given path 'store', 'inventory'
    When method get
    Then status 200

    * print response



