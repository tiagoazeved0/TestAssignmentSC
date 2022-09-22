@Pets
Feature: API Testing Petstore

  Background:
    * configure ssl = true

  Scenario: Delete an existing pet and ensuring that the operation can't be done more than once (with the same petId)

    # POST - Create a new Pet
    # DELETE - Delete the created pet using petId
    # DELETE - Delete the same pet using petId and verifying if the response has an error code.

    * def name = 'Kitty McGee'
    * def status = 'available'

    Given url baseUrl + 'pet'
    And request { name: '#(name)', status: '#(status)' }
    When method post
    Then status 200
    * match response.name == name
    * match response.status == status
    * string petId = response.id
    Given url baseUrl + 'pet/' + petId
    When method delete
    Then status 200
    * match response.code == 200
    * match responseStatus == 200
    * match response.type == 'unknown'
    * match response.message == petId
    Given url baseUrl + 'pet/' + petId
    When method delete
    Then status 404
    * match responseStatus == 404
    * match response == ''

