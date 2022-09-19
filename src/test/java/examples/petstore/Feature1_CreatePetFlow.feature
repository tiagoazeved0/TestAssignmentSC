Feature: Testing Pet Creation CRUD Operations

  Background:
    * url 'https://petstore.swagger.io/v2/'

  Scenario: Creating a Pet with Name

    # POST

    * def petName = 'Kitty McGee'

    Given path 'pet'
    And request { name: '#(petName)' }
    When method post
    Then status 200
    * match response.name == petName

    * def newPetId = response.id

    # GET

    Given path 'pet', newPetId
    When method get
    Then status 200
    * match response.name == petName
    * match response.id == newPetId

    * def status = response.status

    # PUT

    * def updatedName = 'PutTestNewName'
    * def updatedStatus = 'newStatusPutTest'

    * def petBody =
    """
    {
  "id": "#(newPetId)",
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

    Given path 'pet'
    And request petBody
    When method put
    Then status 200
    * match response.id == newPetId
    * match response.name == updatedName
    * match response.status == updatedStatus

    # DELETE

    Given path 'pet', newPetId
    When method delete
    Then status 200

    * string stringNewPetId =  newPetId

    * match response.code == 200
    * match response.type == 'unknown'
    * match response.message == stringNewPetId
