Feature: Petstore PUT Features

  Background:
    * url 'https://petstore.swagger.io/v2/'

  Scenario: Update an existing pet using PUT request

    # PUT - Update an existing pet with body object required

    * def petId = 9223372016900020851
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
  "name": "PutTestNewName",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "newStatusPutTest"
}
    """

    Given path 'pet/'
    And request petBody
    When method put
    Then status 200

    * print response

    * match response.id == petId
    * match response.name == updatedName
    * match response.status == updatedStatus


