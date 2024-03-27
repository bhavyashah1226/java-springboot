# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Azure Open AI and AI Model roostgpt-4-32k
# 
# Feature file generated for /pet/findByStatus_get for http method type GET 
# RoostTestHash=44cafec54d
# 
# 

# ********RoostGPT********
Feature: /v2/pet/findByStatus

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def expectedSchema = """{"type":"array","items":{"type":"object","required":["name","photoUrls"],"properties":{"id":{"type":"integer","format":"int64"},"category":{"type":"object","properties":{"id":{"type":"integer","format":"int64"},"name":{"type":"string"}},"xml":{"name":"Category"}},"name":{"type":"string","example":"doggie"},"photoUrls":{"type":"array","xml":{"wrapped":true},"items":{"type":"string","xml":{"name":"photoUrl"}}},"tags":{"type":"array","xml":{"wrapped":true},"items":{"xml":{"name":"tag"},"type":"object","properties":{"id":{"type":"integer","format":"int64"},"name":{"type":"string"}}}},"status":{"type":"string","description":"pet status in the store","enum":["available","pending","sold"]}},"xml":{"name":"Pet"}}"""
  * configure headers = { api_key: '#(karate.properties['AUTH_TOKEN'])' }
  
Scenario Outline: Find pets by status

  Given path '/v2/pet/findByStatus'
  And param status = '<status>'
  When method get
  Then status 200
  And match response contains { 'status': '<status>'}
  And match response contains expectedSchema[key]

  Examples:
    | status   |
    | available |
    | pending |
    | sold      |

Scenario: Invalid status value

  Given path '/v2/pet/findByStatus'
  And param status = 'invalid_status'
  When method get
  Then status 400
