# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pet/findByTags_get for http method type GET 
# RoostTestHash=01adc2ed1e
# 
# 

# ********RoostGPT********
Feature: Find Pets by tags

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authToken = karate.properties['auth.token'] || karate.get('authToken', 'dummyToken')
  * configure headers = { Authorization: '#(authToken)' }

Scenario: Test Find Pets by tags API with valid tags
  Given path '/v2/pet/findByTags'
  And param tags = ['pet']
  When method get
  Then status 200
  And match response contains { name: '#string', photoUrls: '#[]' }

Scenario: Test Find Pets by tags API with invalid tags
  Given path '/v2/pet/findByTags'
  And param tags = ['invalidTag']
  When method get
  Then status 400
