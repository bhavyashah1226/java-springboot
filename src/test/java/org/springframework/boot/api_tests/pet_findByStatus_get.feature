# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Azure Open AI and AI Model roostgpt-4-32k
# 
# Feature file generated for /pet/findByStatus_get for http method type GET 
# RoostTestHash=44cafec54d
# 
# 

# ********RoostGPT********
Feature: Testing the /v2/pet/findByStatus endpoint from PetStore API

Background:
  * def urlBase = karate.properties['url.base'] || 'http://localhost:8080'
  * url urlBase
  * def auth_token = karate.properties['AUTH_TOKEN']
  * def apiUrl = '/v2/pet/findByStatus'
  * def headers = { api_key: '#(auth_token)' }

Scenario Outline: Validate search Pets by status functionality
  Given path apiUrl
  And param status = '<status>'
  And headers headers
  When method get
  Then status 200
  And match each response contains {name:'#string', photoUrls:'#[]'}
  And match response[*].status contains '<status>'

Examples:
  | status    |
  | 'available'|
  | 'pending' |
  | 'sold'    |

Scenario: Validate a 400 error for invalid status value
  Given path apiUrl
  And param status = 'unknown'
  And headers headers
  When method get
  Then status 400
