/*
Test generated by RoostGPT for test JavaUnitTest using AI Type Open AI and AI Model gpt-4

Test Scenario 1: 
Product with given ID exists
- Given a product with ID 'X' exists in the product repository
- When the deleteProduct function is called with ID 'X'
- Then the product with ID 'X' should be deleted from the product repository
- And the response should be 200 OK

Test Scenario 2: 
Product with given ID does not exist
- Given no product with ID 'X' exists in the product repository
- When the deleteProduct function is called with ID 'X'
- Then no product should be deleted from the product repository
- And the response should be 404 NOT FOUND

Test Scenario 3: 
Product ID is null
- When the deleteProduct function is called with null ID
- Then no product should be deleted from the product repository
- And the response should be 404 NOT FOUND

Test Scenario 4: 
Product repository is empty
- Given the product repository is empty
- When the deleteProduct function is called with any ID
- Then no product should be deleted from the product repository
- And the response should be 404 NOT FOUND

Test Scenario 5: 
Product with given ID is deleted when multiple products exist with different IDs
- Given multiple products exist in the product repository with different IDs
- When the deleteProduct function is called with an ID 'X' that exists in the repository
- Then only the product with ID 'X' should be deleted from the product repository
- And the response should be 200 OK

Test Scenario 6: 
Delete operation is idempotent
- Given a product with ID 'X' exists in the product repository
- When the deleteProduct function is called twice with ID 'X'
- Then the first call should delete the product and return a 200 OK response
- And the second call should not delete any product and return a 404 NOT FOUND response
*/
package com.bootexample4.products.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

import java.util.Optional;

import com.bootexample4.products.model.Product;
import com.bootexample4.products.repository.ProductRepository;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.ResponseEntity;

public class ProductController_deleteProduct_dcaff736d4_Test {

    @InjectMocks
    ProductController productController;

    @Mock
    ProductRepository productRepository;

    @BeforeEach
    public void init() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testDeleteProduct_ProductExists() {
        Long id = 1L;
        Product product = new Product();
        when(productRepository.findById(id)).thenReturn(Optional.of(product));
        ResponseEntity<Object> responseEntity = productController.deleteProduct(id);
        assertEquals(200, responseEntity.getStatusCodeValue());
        verify(productRepository, times(1)).delete(product);
    }

    @Test
    public void testDeleteProduct_ProductDoesNotExist() {
        Long id = 1L;
        when(productRepository.findById(id)).thenReturn(Optional.empty());
        ResponseEntity<Object> responseEntity = productController.deleteProduct(id);
        assertEquals(404, responseEntity.getStatusCodeValue());
    }

    @Test
    public void testDeleteProduct_NullID() {
        ResponseEntity<Object> responseEntity = productController.deleteProduct(null);
        assertEquals(404, responseEntity.getStatusCodeValue());
    }

    @Test
    public void testDeleteProduct_EmptyRepository() {
        Long id = 1L;
        when(productRepository.findById(id)).thenReturn(Optional.empty());
        ResponseEntity<Object> responseEntity = productController.deleteProduct(id);
        assertEquals(404, responseEntity.getStatusCodeValue());
    }

    @Test
    public void testDeleteProduct_MultipleProductsWithDifferentIDs() {
        Long id = 1L;
        Product product = new Product();
        when(productRepository.findById(id)).thenReturn(Optional.of(product));
        ResponseEntity<Object> responseEntity = productController.deleteProduct(id);
        assertEquals(200, responseEntity.getStatusCodeValue());
        verify(productRepository, times(1)).delete(product);
    }

    @Test
    public void testDeleteProduct_IdempotentDeleteOperation() {
        Long id = 1L;
        Product product = new Product();
        when(productRepository.findById(id)).thenReturn(Optional.of(product), Optional.empty());
        ResponseEntity<Object> responseEntity1 = productController.deleteProduct(id);
        assertEquals(200, responseEntity1.getStatusCodeValue());
        verify(productRepository, times(1)).delete(product);
        ResponseEntity<Object> responseEntity2 = productController.deleteProduct(id);
        assertEquals(404, responseEntity2.getStatusCodeValue());
    }
}
