# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pet/{petId}/uploadImage_post for http method type POST 
# RoostTestHash=8dac89cb33
# 
# 

# ********RoostGPT********
Feature: Pet Image Upload

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authToken = karate.properties['auth.token'] || karate.get('authToken', 'defaultToken')
  * configure headers = { Authorization: '#(authToken)' }

Scenario: Upload an image for a pet
  Given path 'v2', 'pet', 1, 'uploadImage'
  And multipart field 'additionalMetadata' = 'test metadata'
  And multipart file 'file' = { read: 'test.jpg', filename: 'test.jpg', contentType: 'image/jpg' }
  When method post
  Then status 200
  And match response contains { code: '#number', type: '#string', message: '#string' }

