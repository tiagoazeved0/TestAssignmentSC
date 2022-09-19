Feature: Store POST Features

  Background:
    * url 'https://petstore.swagger.io/v2/'

  Scenario: Place an order for a pet

    # POST - Order a Pet with petID
    * def petId = 9223372016900022666
    * def quantity = 1
    * def complete = true

    Given path 'store', 'order'
    And request { petId: '#(petId)', quantity: '#(quantity)', complete: '#(complete)' }
    When method post
    Then status 200

    * match response.petId == petId
    * match response.quantity == quantity
    * match response.complete == complete

    * def orderId = response.id
    * print '[ ------ ]', response
