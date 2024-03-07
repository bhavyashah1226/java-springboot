# ********RoostGPT********

# Test generated by RoostGPT for test products-karate using AI Type Azure Open AI and AI Model roost-gpt4-32k
# 
# Test generated for /products/{productId}_get for http method type GET in karate framework
# RoostTestHash=ab8efa24ed
# 
# 

# ********RoostGPT********
Feature: Find product by ID

Background:
  * url target = "{{ $processEnvironment.API_HOST }}"
  * text payload =
    """
      someProductId
      4
    """
  * csv data = read('products_productId_get_karate.csv', payload)
  * def token = "Bearer {{$processEnvironment.AUTH_TOKEN}}"

Scenario: Find product by ID Test 
   Given path '/products/', data[0].someProductId
   And header Authorization = token
   When method GET
   Then status 200
   And match responseHeaders contains { Content-Type: 'application/json' }
   
   # Assert required properties in the response body 
   And match response contains {id: '#integer', name: '#string', description: '#string', price: '#integer'}
   
   # Additional data format and pattern checks here
   # Use '#regex' for regular expression matching
   # Use '#?' for existence checks
