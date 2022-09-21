@Pets
Feature: API Testing Petstore

  Background:
    * url 'https://petstore.swagger.io/v2/'

  Scenario: Create a Pet and Update it using PUT request

    # POST - Create a new Pet with 'name' and 'status'
    # PUT - Update an existing pet with body object required

    * def name = 'Kitty McGee'
    * def status = 'available'
    Given path 'pet/'
    And request { name: '#(name)', status: '#(status)' }
    When method post
    Then status 200
    * match responseStatus == 200
    * match response.name == name
    * match response.status == status
    * def petId = response.id

    * def updatedName = 'PutTestNewName'
    * def updatedStatus = 'newStatusPutTest'
    * def petBody =
    """
    {
  "id": "#(petId)",
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "#(updatedName)",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "#(updatedStatus)"
}
    """

    Given path 'pet/'
    And request petBody
    When method put
    Then status 200
    * match response.id == petId
    * match response.name == updatedName
    * match response.status == updatedStatus


