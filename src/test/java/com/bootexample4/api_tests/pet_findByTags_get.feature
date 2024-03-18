# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pet/findByTags_get for http method type GET 
# RoostTestHash=01adc2ed1e
# 
# 

# ********RoostGPT********
Feature: Pet Store API Test

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authToken = karate.properties['authToken'] || karate.get('authToken', 'sampleAuthToken')
  * def authHeader = {Authorization: '#(authToken)'}

Scenario: Find Pets by Tags
  Given path '/v2/pet/findByTags'
  And params {tags: ['pet']}
  And header authHeader
  When method get
  Then status 200
  And match response contains {name: '#string', photoUrls: '#[]'}
  And match each response[*].id == '#number'
  And match each response[*].category.id == '#number'
  And match each response[*].category.name == '#string'
  And match each response[*].name == '#string'
  And match each response[*].photoUrls[*] == '#string'
  And match each response[*].tags[*].id == '#number'
  And match each response[*].tags[*].name == '#string'
  And match each response[*].status == '#string'

Scenario: Invalid tag value
  Given path '/v2/pet/findByTags'
  And params {tags: ['invalidTag']}
  And header authHeader
  When method get
  Then status 400
