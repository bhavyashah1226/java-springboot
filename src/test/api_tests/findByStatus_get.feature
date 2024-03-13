# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pet/findByStatus_get for http method type GET 
# RoostTestHash=467fc95f1c
# 
# 

# ********RoostGPT********
Feature: Pet Store API Tests

Background:
  * url target
  * def authToken = $processEnvironment.AUTH_TOKEN
  * configure headers = { 'Authorization': '#(authToken)' }

Scenario: Find Pets by status
  Given path '/v2/pet/findByStatus'
  And param status = ['available']
  When method get
  Then status 200
  And match response contains { 'id': '#number', 'name': '#string', 'photoUrls': '#[]', 'status': '#string' }
  And match response[*].photoUrls[*] contains '#string'
  And match response[*].tags[*] contains { 'id': '#number', 'name': '#string' }

Scenario: Invalid status value
  Given path '/v2/pet/findByStatus'
  And param status = ['invalid_status']
  When method get
  Then status 400
