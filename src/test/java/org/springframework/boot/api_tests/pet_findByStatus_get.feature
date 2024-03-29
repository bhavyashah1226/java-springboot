# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Azure Open AI and AI Model roostgpt-4-32k
# 
# Feature file generated for /pet/findByStatus_get for http method type GET 
# RoostTestHash=44cafec54d
# 
# 

# ********RoostGPT********
Feature: Testing the /v2/pet/findByStatus API endpoint

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authToken = karate.properties['AUTH_TOKEN']
  * configure headers = { api_key: '#(authToken)' }

Scenario Outline: Test that GET request to /v2/pet/findByStatus with valid status values returns expected results
  Given path '/v2/pet/findByStatus'
  And param status = '<status>'
  When method GET
  Then match responseStatus == <responseStatus>
  And match response[*].status contains '<status>'
  And match response[*].name != '#null'
  And match response[*].photoUrls != '#null'

  Examples:
    | status     | responseStatus |
    | 'available' | 200            |
    | 'pending'  | 200            |
    | 'sold'     | 200            |

Scenario: Test that GET request to /v2/pet/findByStatus with invalid status value returns a 400
  Given path '/v2/pet/findByStatus'
  And param status = 'invalid_status'
  When method GET
  Then status 400
