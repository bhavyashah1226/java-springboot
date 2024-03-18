# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pet/{petId}_post for http method type POST 
# RoostTestHash=c0bc5294a0
# 
# 

# ********RoostGPT********
Feature: Updates a pet in the store with form data

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * configure headers = { Authorization: '#(authToken)' }

Scenario: Updating a pet in the store with valid form data
  * def authToken = karate.properties['authToken'] || karate.get('authToken', 'sampleAuthToken')
  * path '/v2/pet/{petId}'
  * form-field name = 'UpdatedName'
  * form-field status = 'UpdatedStatus'
  * method post
  * status 200

Scenario: Updating a pet in the store with invalid form data
  * def authToken = karate.properties['authToken'] || karate.get('authToken', 'sampleAuthToken')
  * path '/v2/pet/{petId}'
  * form-field name = 'InvalidName'
  * form-field status = 'InvalidStatus'
  * method post
  * status 405

Examples:
  | petId |
  | 1     |
  | 2     |
  | 3     |
