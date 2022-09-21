Feature: API Testing Petstore

  Background:
    * configure ssl = true

  Scenario: Create a Pet and make an Order and get Order by orderId

    # POST - Create a new Pet with 'name' and 'status'
    # POST - Order a Pet with petID
    # GET - Get Purchase Order By orderId

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
    * def orderId = response.id
    Given url baseUrl + 'store/' + 'order/' + orderId
    When method get
    Then status 200
    * match response.id == '#(parseInt(orderId))'
    * match response.complete == true


  Scenario: Returns Pet Inventories by status

    # GET - Returns Pet Inventories by status

    * string randomStatus = Math.random().toString(36).slice(-8);

    Given url baseUrl + 'pet/'
    And request { status: '#(randomStatus)' }
    When method post
    Then status 200
    Given url baseUrl + 'store/' + 'inventory'
    When method get
    Then status 200




