# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pets_get for http method type GET 
# RoostTestHash=13f57c0784
# 
# 

# ********RoostGPT********
Feature: Petstore API tests

Background:
* url target: '{{ $processEnvironment.API_HOST }}'
* def auth = { Authorization: '#(authToken)' }
* configure headers = auth
* def authToken = $processEnvironment.AUTH_TOKEN

Scenario: List all pets
Given path '/pets'
And param limit = read('pets_get.csv')
When method get
Then status 200
And match header x-next == '#string'
And match each response == { id: '#number', name: '#string', tag: '#?string' }

Scenario: List all pets with invalid limit
Given path '/pets'
And param limit = 101
When method get
Then status 400
And match response == { code: '#number', message: '#string' }
