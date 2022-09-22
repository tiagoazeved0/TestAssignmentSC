@Pets
Feature: API Testing Petstore

  Background:
    * configure ssl = true

  Scenario: Get the information of the pet by using petId

    # POST - Create a new Pet
    # GET - Get the created pet using petId

    * def name = 'Bobby McGeee'
    * def status = 'available'

    Given url baseUrl + 'pet'
    And request { name: '#(name)', status: '#(status)' }
    When method post
    Then status 200
    * match response.name == name
    * match response.status == status
    * def createdPetId = response.id
    Given url baseUrl + 'pet/' + createdPetId
    When method get
    Then status 200
    * match response.name == name
    * match response.status == status
    * match responseStatus == 200
    * match response.id == createdPetId

  Scenario: Get all the pets using the status value

    # GET - Get all Pets by status

    * def status  = 'available'

    Given url baseUrl + 'pet/' + 'findByStatus'
    And params {'status': '#(status)'}
    When method get
    Then status 200
    * match responseStatus == 200
    * match response != null
