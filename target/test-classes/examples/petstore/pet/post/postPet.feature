@Pets
Feature: Petstore POST Features

  Background:
    * url 'https://petstore.swagger.io/v2/'

  Scenario: Post Pet with Name

    # This flow consists in 2 HTTP Requests:
    # POST - Create a new Pet
    # GET - Get the created pet using petId


    * def name = 'Kitty McGee'
    * def status = 'available'

    Given path 'pet/'
    And request { name: '#(name)', status: '#(status)' }
    When method post
    Then status 200
    * assert response.name == name
    * assert response.status == status

#    * def createdPetId = response.id
#    * print '[ --- The value of Created Pet is:  ', createdPetId, ' --- ]'
#    * print '[ ------ ]', response

  Scenario: Updates a pet in the store with form data - name and status

    # POST - Updates existing pet with form data - name and status
    * def petId = '9223372016900020566'

    Given path 'pet/' + petId
    And form field name = 'Test'
    And form field status = 'newStatus'
    When method post
    Then status 200
    * match response.code == 200
    * match response.type == 'unknown'
    * match response.message == petId


  Scenario: Upload an image to a pet with his ID

    # POST - Uploads an image to a pet, through its id
    * def name = 'Kuba'
    * def petId = '9223372016900017148'

    Given path 'pet/' + petId + '/uploadImage'
    * multipart file file = { read: 'kitty.jpg', contentType: 'image/jpeg' }
    * multipart field message  = 'Hello!'
    When method post
    Then status 200
    * match response.code == 200
    * match response.type == 'unknown'
    * match response.message contains 'File uploaded'
