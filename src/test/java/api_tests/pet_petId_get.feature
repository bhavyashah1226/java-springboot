# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pet/{petId}_get for http method type GET 
# RoostTestHash=018c365850
# 
# 

# ********RoostGPT********
Feature: Pet Store API Tests

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authToken = karate.properties['auth.token'] || karate.get('authToken', '$processEnvironment.AUTH_TOKEN')
  * configure headers = { Authorization: '#(authToken)' }

Scenario: Fetch pet by ID

  Given path '/v2/pet/{petId}'
  And params { petId: '#(petId)' }
  When method get
  Then status 200
  And match response == { id: '#(petId)', name: '#string', photoUrls: '#[]', tags: '#[]', status: '#string' }
  And match response.category == { id: '#number', name: '#string' }

  Examples:
    | petId |
    | 1     |
    | 2     |
    | 3     |

Scenario: Fetch pet by ID - Invalid ID supplied

  Given path '/v2/pet/{petId}'
  And params { petId: '#(invalidPetId)' }
  When method get
  Then status 400

  Examples:
    | invalidPetId |
    | 'abc'        |
    | '-1'         |
    | '0'          |

Scenario: Fetch pet by ID - Pet not found

  Given path '/v2/pet/{petId}'
  And params { petId: '#(nonExistentPetId)' }
  When method get
  Then status 404

  Examples:
    | nonExistentPetId |
    | 9999             |
    | 8888             |
    | 7777             |

