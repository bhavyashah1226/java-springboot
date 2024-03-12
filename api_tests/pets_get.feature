# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pets_get for http method type GET 
# RoostTestHash=13f57c0784
# 
# 

# ********RoostGPT********
Feature: Pets API

  Background:
    * url target
    * header Authorization = 'Bearer ' + $processEnvironment.AUTH_TOKEN

  Scenario: List all pets
    Given path '/pets'
    And param limit = limit
    When method get
    Then status 200
    And match each response contains {id:'#integer', name:'#string', tag:'#?string'}
    And match responseHeaders contains {x-next:'#string'}

    Examples:
      | limit |
      | 10    |
      | 20    |
      | 50    |

  Scenario: List all pets - Negative case
    Given path '/pets'
    And param limit = 101
    When method get
    Then status 400

    Scenario: Unexpected error
      Given path '/pets'
      And param limit = 'invalid'
      When method get
      Then status 500
      And match response contains {code:'#integer', message:'#string'}
