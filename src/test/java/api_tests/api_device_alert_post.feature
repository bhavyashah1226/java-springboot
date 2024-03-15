# ********RoostGPT********

# Test generated by RoostGPT for test MultipleApiSpec using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /api/device/alert_post for http method type POST 
# RoostTestHash=f92ec5d141
# 
# 

# ********RoostGPT********
Feature: Testing /api/device/alert endpoint

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authToken = karate.properties['auth.token'] || karate.get('authToken', 'myDefaultAuthToken')
  * def Authorization = 'Bearer ' + authToken
  * configure headers = { Authorization: '#(Authorization)' }

Scenario: Send device online/offline status to user via etown
  Given path '/api/device/alert'
  And request { jetson_uuid: '#(jetson_uuid)', status: '#(status)', timestamp: '#(timestamp)' }
  When method post
  Then status 201
  And match response == { description: 'alert created' }

Scenario Outline: Testing invalid inputs
  Given path '/api/device/alert'
  And request { jetson_uuid: '#(jetson_uuid)', status: '#(status)', timestamp: '#(timestamp)' }
  When method post
  Then status 400
  And match response == { description: 'invalid input, object invalid' }

  Examples:
    | jetson_uuid                             | status  | timestamp               |
    | 'd290f1ee-6c54-4b01-90e6-d701748f0851'  | 'online' | '2023-11-29T09:12:33.001Z' |
    | 'd290f1ee-6c54-4b01-90e6-d701748f0851'  | 'offline' | '2023-11-29T09:12:33.001Z' |
    | 'invalid_uuid'                          | 'online' | '2023-11-29T09:12:33.001Z' |
    | 'd290f1ee-6c54-4b01-90e6-d701748f0851'  | 'invalid_status' | '2023-11-29T09:12:33.001Z' |
    | 'd290f1ee-6c54-4b01-90e6-d701748f0851'  | 'online' | 'invalid_timestamp' |
