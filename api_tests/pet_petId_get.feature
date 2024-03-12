# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pet/{petId}_get for http method type GET 
# RoostTestHash=561990ad39
# 
# 

# ********RoostGPT********
Feature: Testing /v2/pet/{petId} endpoint

Background:
* url target = processEnvironment.API_HOST
* header Authorization = processEnvironment.AUTH_TOKEN

Scenario: Test GET /v2/pet/{petId} with valid petId
  Given path 'v2', 'pet', 1
  When method get
  Then status 200
  And match response == { id: '#number', name: 'doggie', photoUrls: '#[] _', status: 'available'}

Scenario Outline: Test GET /v2/pet/{petId} with various petId
  Given path 'v2', 'pet', <petId>
  When method get
  Then status <status>
  Examples:
  | petId | status |
  | 1     | 200    |
  | 0     | 400    |
  | -1    | 400    |
  | 9999  | 404    |

Scenario: Test GET /v2/pet/{petId} verifies response schema
  Given path 'v2', 'pet', 1
  When method get
  Then status 200
  And match each response == { id: '#number', category: '#object', name: '#string', photoUrls: '#[] _', tags: '#[] _', status: '#string'}
