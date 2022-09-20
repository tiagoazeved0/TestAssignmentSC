Feature: API Testing Petstore

  Background:

  Scenario: Login with Username and Password

    # GET - Login with username and password

    * def username = "zbxt5dg6"
    * def password = "ewbz0p52"

    * print baseUrl + 'user/login'
    Given url baseUrl + 'user/login'
    When method get
    Then status 200

    * print response

    * match response.code == 200
    * match response.type == "unknown"
    * match response.message contains "logged in"

  Scenario: Get User By Username

    # GET - Get User by its username

    * def username = "zbxt5dg6"

    * print baseUrl + 'user/' + username
    Given url baseUrl + 'user/' + username
    When method get
    Then status 200

    * print response

    * match response.username == username

  Scenario: Login with Username and Password

    # GET - Login with username and password

    * def username = "zbxt5dg6"
    * def password = "ewbz0p52"

    * print baseUrl + 'user/logout'
    Given url baseUrl + 'user/logout'
    When method get
    Then status 200

    * print response

    * match response.code == 200
    * match response.type == "unknown"
    * match response.message contains "ok"
