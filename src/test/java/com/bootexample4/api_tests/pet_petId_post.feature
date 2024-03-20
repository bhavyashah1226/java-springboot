# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Azure Open AI and AI Model roostgpt-4-32k
# 
# Feature file generated for /pet/{petId}_post for http method type POST 
# RoostTestHash=c0bc5294a0
# 
# 

# ********RoostGPT********
Feature: PetStore API - Pet Update

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * def invalidResponseDesc = 'Invalid input'
    
  @updatePetWithForm
  Scenario Outline: Test Pet update operation with Form Data
    Given path '/v2/pet/', '<petId>'
    And header Authorization = 'Bearer ' + authToken
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field name = '<name>'
    And form field status = '<status>'
    When method post
    Then status 200
    And match response.message == invalidResponseDesc

    Examples: 
      | petId | name 	 | status	 |
      | 1     | 'Tommy' | 'available' |
      | 2     | 'Tommy' | 'sold' 	 |
