@Pets
Feature: API Testing Petstore

  Background:
    * configure ssl = true

  Scenario: Create a Pet with Name and Status in Request Body

    # POST - Create a new Pet with 'name' and 'status'

    * def name = 'Kitty McGee'
    * def status = 'available'

    Given url baseUrl + 'pet'
    And request { name: '#(name)', status: '#(status)' }
    When method post
    Then status 200
    * match response.name == name
    * match response.status == status

  Scenario: Create a Pet with Name and Status with Parameters

    # POST - Create a new Pet with 'name' and 'status'

    * def name = 'Kitty McGee'
    * def status = 'available'

    Given url baseUrl + 'pet'
    And params { name: '#(name)', status: '#(status)' }
    When method post
    Then status 415
    * match responseStatus == 415
    * match response.type == 'unknown'

  Scenario: Create a Pet and Updates the Pet

    # POST - Create a new Pet with 'name' and 'status'
    # POST - Updates created pet with form data - 'name' and 'status'

    * def name = 'Kitty McGee'
    * def status = 'available'

    Given url baseUrl + 'pet'
    And request { name: '#(name)', status: '#(status)' }
    When method post
    Then status 200
    * match response.name == name
    * match response.status == status
    * def petId = response.id
    Given url baseUrl + 'pet/' + petId
    And form field name = 'Bobby Bobby'
    And form field status = 'newStatus'
    When method post
    Then status 200
    * string petIdString = petId
    * match response.code == 200
    * match responseStatus == 200
    * match response.type == 'unknown'
    * match response.message == petIdString

  Scenario: Create a Pet and Uploads an image to that Pet

    # POST - Create a new Pet with 'name' and 'status'
    # POST - Uploads an image to a pet, through its id

    * def name = 'Kitty McGee'
    * def status = 'available'

    Given url baseUrl + 'pet'
    And request { name: '#(name)', status: '#(status)' }
    When method post
    Then status 200
    * match response.name == name
    * match response.status == status
    * def petId = response.id
    Given url baseUrl + 'pet/' + petId + '/uploadImage'
    * multipart file file = { read: 'kitty.jpg', contentType: 'image/jpeg' }
    * multipart field message  = 'Hello!'
    When method post
    Then status 200
    * match response.code == 200
    * match responseStatus == 200
    * match response.type == 'unknown'
    * match response.message contains 'File uploaded'
