@Pets
Feature: API Testing Petstore

  Background:
    * url 'https://petstore.swagger.io/v2/'

  Scenario: Get the information of the pet by using petId

    # POST - Create a new Pet
    # GET - Get the created pet using petId

    * def name = 'Bobby McGeee'
    * def status = 'available'

    Given path 'pet/'
    And request { name: '#(name)', status: '#(status)' }
    When method post
    Then status 200
    * match response.name == name
    * match response.status == status
    * def createdPetId = response.id
    Given path 'pet', createdPetId
    When method get
    Then status 200
    * match response.name == name
    * match response.status == status
    * match responseStatus == 200
    * match response.id == createdPetId

  Scenario: Get all the pets using the status value

    # GET - Get all Pets by status

    * def status  = 'available'

    Given path 'pet/'
    And path 'findByStatus'
    And params {'status': '#(status)'}
    When method get
    Then status 200
    * match responseStatus == 200
    * match response != null
