# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pets_post for http method type POST 
# RoostTestHash=e8c8a5ec2f
# 
# 

# ********RoostGPT********
Feature: Pets API

Background:
  * url target
  * def authToken = karate.properties['AUTH_TOKEN']
  * configure headers = { Authorization: '#(authToken)' }

Scenario: Create a pet
  Given path '/pets'
  And request { id: '#(id)', name: '#(name)', tag: '#(tag)' }
  When method post
  Then status 201
  And match response == {}

Scenario: Create a pet - unexpected error
  Given path '/pets'
  And request { id: '#(id)', name: '#(name)', tag: '#(tag)' }
  When method post
  Then status 400
  And match response contains { code: '#number', message: '#string' }

Examples:
  | id | name   | tag   |
  | 1  | 'Dog'  | 'Pet' |
  | 2  | 'Cat'  | 'Pet' |
  | 3  | 'Bird' | 'Pet' |
