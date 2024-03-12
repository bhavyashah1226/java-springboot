# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /user/{username}_put for http method type PUT 
# RoostTestHash=ec22222bac
# 
# 

# ********RoostGPT********
Feature: User API

Background:
  * url target
  * def authToken = karate.properties['AUTH_TOKEN']

Scenario: Test updateUser endpoint
  Given path '/v2/user/{username}'
  And request {"id": 1, "username": "test", "firstName": "Test", "lastName": "User", "email": "testuser@gmail.com", "password": "password", "phone": "1234567890", "userStatus": 1}
  When method put
  Then status 200
  And match response == {"id": '#number', "username": '#string', "firstName": '#string', "lastName": '#string', "email": '#string', "password": '#string', "phone": '#string', "userStatus": '#number'}

Examples:
  | username |
  | 'test'   |
