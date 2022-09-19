Feature: User POST Features

#  Background:
#    * url 'https://petstore.swagger.io/v2/'

  Scenario: Create a User

    # POST - Create a User

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


  Scenario: Create New Users from Given Array

    # POST - Create New Users from Given Array

    * def fakerObj = new faker()
    * def username2 = Math.random().toString(36).slice(-8);
    * def firstName2 = fakerObj.name().firstName()
    * def lastName2 = fakerObj.name().lastName()
    * def email2 = Math.random().toString(36).substring(2,11) + '@gmail.com';
    * def password2 = Math.random().toString(36).slice(-8);
    * def phone2 = Math.floor(Math.random() * 1000000000);

    * def username3 = Math.random().toString(36).slice(-8);
    * def firstName3 = fakerObj.name().firstName()
    * def lastName3 = fakerObj.name().lastName()
    * def email3 = Math.random().toString(36).substring(2,11) + '@gmail.com';
    * def password3 = Math.random().toString(36).slice(-8);
    * def phone3 = Math.floor(Math.random() * 1000000000);


    * def newUsersBodyArray =
    """
[
    {
        "username2": "#(username2)",
        "firstName2": "#(firstName2)",
        "lastName2": "#(lastName2)",
        "email2": "#(email2)",
        "password2": "#(password2)",
        "phone2": "#(phone2)"
    },
    {
        "username3": "#(username3)",
        "firstName3": "#(firstName3)",
        "lastName3": "#(lastName3)",
        "email3": "#(email3)",
        "password3": "#(password3)",
        "phone3": "#(phone3)"
    }
]
  """

    Given url baseUrl + 'user/createWithArray'
    And request newUsersBodyArray
    When method post
    Then status 200

    * match response.code == 200
    * match response.type == 'unknown'
