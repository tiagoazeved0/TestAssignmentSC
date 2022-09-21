Feature: API Testing Petstore

  Background:

  Scenario: Update an existing user using PUT request while being logged in

    # Creating user

    * def fakerObj = new faker()
    * def username = Math.random().toString(36).slice(-8);
    * def firstName = fakerObj.name().firstName()
    * def lastName = fakerObj.name().lastName()
    * def email = Math.random().toString(36).substring(2,11) + '@gmail.com';
    * def password = Math.random().toString(36).slice(-8);
    * def phone = Math.floor(Math.random() * 1000000000);

    * def newUserBody =
    """
  {
  "username": "#(username)",
  "firstName": "#(firstName)",
  "lastName": "#(lastName)",
  "email": "#(email)",
  "password": "#(password)",
  "phone": "#(phone)"
  }
  """

    Given url baseUrl + 'user'
    And request newUserBody
    When method post
    Then status 200

    * string userId = response.message
    * def numberUserId = parseInt(userId)

    * match response.code == 200
    * match response.type == 'unknown'

    # Logging in

    * print baseUrl + 'user/login'
    Given url baseUrl + 'user/login'
    When method get
    Then status 200
    * match response.code == 200
    * match response.type == "unknown"
    * match response.message contains "logged in"

    # Updating user

    * def firstName2 = fakerObj.name().firstName()
    * def lastName2 = fakerObj.name().lastName()
    * def email2 = Math.random().toString(36).substring(2,11) + '@gmail.com';

    * def updatedUserBody =
    """
  {
  "username": "#(username)",
  "firstName": "#(firstName2)",
  "lastName": "#(lastName2)",
  "email": "#(email2)",
  "password": "#(password)",
  "phone": "#(phone)"
  }
  """

    Given url baseUrl + /user/ + username
    And request updatedUserBody
    When method put
    Then status 200
    * match response.code == 200
    * match response.type == "unknown"


