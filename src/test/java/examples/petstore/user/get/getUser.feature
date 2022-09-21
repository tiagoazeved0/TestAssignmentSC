Feature: API Testing Petstore

  Background:

  Scenario: Create a User and Login with Username and Password

    # POST - Create a User
    # GET - Login with username and password

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
    * match response.code == 200
    * match response.type == 'unknown'
    * def username = response.username
    * def password = response.password
    Given url baseUrl + 'user/login'
    When method get
    Then status 200
    * match response.code == 200
    * match response.type == "unknown"
    * match response.message contains "logged in"

  Scenario: Get User By Username

    # POST - Create a User
      # GET - Get User by its username

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
    * match response.code == 200
    Given url baseUrl + 'user/' + username
    When method get
    Then status 200
    * print response

#    * print response

  Scenario: Create a User, Login, and Logout with Username and Password

    # POST - Create a User
    # GET - Login with username and password
      # GET - Logout with username and password


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
    * match response.code == 200
    * match response.type == 'unknown'
    * def username = response.username
    * def password = response.password
    Given url baseUrl + 'user/login'
    When method get
    Then status 200
    * match response.code == 200
    * match response.type == "unknown"
    * match response.message contains "logged in"
    Given url baseUrl + 'user/logout'
    When method get
    Then status 200
    * print response
    * match response.code == 200
    * match response.type == "unknown"
    * match response.message contains "ok"
