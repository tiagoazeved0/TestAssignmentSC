Feature: API Testing Petstore

  Background:
    * configure ssl = true

  Scenario: Create a Pet and place an Order for that Pet

    # POST - Create a new Pet with 'name' and 'status'
    # POST - Order a Pet with petID

    * def name = 'Kitty McGee'
    * def status = 'available'

    Given url baseUrl + 'pet/'
    And request { name: '#(name)', status: '#(status)' }
    When method post
    Then status 200
    * match response.name == name
    * match response.status == status
    * def petId = response.id
    * def quantity = 1
    * def complete = true
    Given url baseUrl + 'store/' + 'order'
    And request { petId: '#(petId)', quantity: '#(quantity)', complete: '#(complete)' }
    When method post
    Then status 200
    * match response.petId == petId
    * match response.quantity == quantity
    * match response.complete == complete

