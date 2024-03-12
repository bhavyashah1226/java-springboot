# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /store/order/{orderId}_get for http method type GET 
# RoostTestHash=959486ed06
# 
# 

# ********RoostGPT********
Feature: Test /v2/store/order/{orderId} endpoint

Background:
  * url target

Scenario: Test GET method with valid orderId
  Given path '/v2/store/order', 1
  And header Authorization = 'Bearer ' + $processEnvironment.AUTH_TOKEN
  When method get
  Then status 200
  And match response ==
  """
  {
    "id": '#number',
    "petId": '#number',
    "quantity": '#number',
    "shipDate": '#string',
    "status": '#string',
    "complete": '#boolean'
  }
  """

Scenario Outline: Test GET method with invalid orderId
  Given path '/v2/store/order', <orderId>
  And header Authorization = 'Bearer ' + $processEnvironment.AUTH_TOKEN
  When method get
  Then status <status>

  Examples:
    | orderId | status |
    | 0       | 400    |
    | 11      | 400    |
    | 'abc'   | 400    |
    | null    | 400    |
