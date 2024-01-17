/*
Test generated by RoostGPT for test JavaUnitTest using AI Type Open AI and AI Model gpt-4

1. Scenario: Update existing product
   - Given a product with ID exists in the repository
   - When we send a request to update the product with valid data
   - Then the product should be updated in the repository
   - And the updated product should be returned in the response with a 200 OK status

2. Scenario: Update non-existing product
   - Given a product with ID does not exist in the repository
   - When we send a request to update the product
   - Then a 404 Not Found status should be returned

3. Scenario: Update product with invalid ID
   - Given an invalid product ID
   - When we send a request to update the product
   - Then a 404 Not Found status should be returned

4. Scenario: Update product with empty name
   - Given a product with ID exists in the repository
   - When we send a request to update the product with an empty name
   - Then the product should not be updated
   - And a validation error should be returned

5. Scenario: Update product with empty description
   - Given a product with ID exists in the repository
   - When we send a request to update the product with an empty description
   - Then the product should not be updated
   - And a validation error should be returned

6. Scenario: Update product with negative price
   - Given a product with ID exists in the repository
   - When we send a request to update the product with a negative price
   - Then the product should not be updated
   - And a validation error should be returned

7. Scenario: Update product with zero price
   - Given a product with ID exists in the repository
   - When we send a request to update the product with a zero price
   - Then the product should be updated
   - And the updated product should be returned in the response with a 200 OK status
*/
package com.bootexample4.products.controller;

import com.bootexample4.products.model.Product;
import com.bootexample4.products.repository.ProductRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.ResponseEntity;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class ProductController_updateProduct_9454a9af90_Test {

    @Mock
    private ProductRepository productRepository;

    private ProductController productController;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.initMocks(this);
        productController = new ProductController(productRepository);
    }

    @Test
    public void testUpdateProduct_Success() {
        Product existingProduct = new Product("Existing Product", "Description", 100.0);
        Product newProduct = new Product("Updated Product", "Updated Description", 200.0);
        when(productRepository.findById(1L)).thenReturn(Optional.of(existingProduct));
        when(productRepository.save(any(Product.class))).thenReturn(newProduct);

        ResponseEntity<Product> responseEntity = productController.updateProduct(1L, newProduct);

        assertEquals(200, responseEntity.getStatusCodeValue());
        assertEquals(newProduct, responseEntity.getBody());
    }

    @Test
    public void testUpdateProduct_NotFound() {
        Product newProduct = new Product("Updated Product", "Updated Description", 200.0);
        when(productRepository.findById(1L)).thenReturn(Optional.empty());

        ResponseEntity<Product> responseEntity = productController.updateProduct(1L, newProduct);

        assertEquals(404, responseEntity.getStatusCodeValue());
    }

    @Test
    public void testUpdateProduct_InvalidId() {
        Product newProduct = new Product("Updated Product", "Updated Description", 200.0);

        ResponseEntity<Product> responseEntity = productController.updateProduct(-1L, newProduct);

        assertEquals(404, responseEntity.getStatusCodeValue());
    }

    @Test
    public void testUpdateProduct_EmptyName() {
        Product existingProduct = new Product("Existing Product", "Description", 100.0);
        Product newProduct = new Product("", "Updated Description", 200.0);
        when(productRepository.findById(1L)).thenReturn(Optional.of(existingProduct));

        assertThrows(IllegalArgumentException.class, () -> productController.updateProduct(1L, newProduct));
    }

    @Test
    public void testUpdateProduct_EmptyDescription() {
        Product existingProduct = new Product("Existing Product", "Description", 100.0);
        Product newProduct = new Product("Updated Product", "", 200.0);
        when(productRepository.findById(1L)).thenReturn(Optional.of(existingProduct));

        assertThrows(IllegalArgumentException.class, () -> productController.updateProduct(1L, newProduct));
    }

    @Test
    public void testUpdateProduct_NegativePrice() {
        Product existingProduct = new Product("Existing Product", "Description", 100.0);
        Product newProduct = new Product("Updated Product", "Updated Description", -200.0);
        when(productRepository.findById(1L)).thenReturn(Optional.of(existingProduct));

        assertThrows(IllegalArgumentException.class, () -> productController.updateProduct(1L, newProduct));
    }

    @Test
    public void testUpdateProduct_ZeroPrice() {
        Product existingProduct = new Product("Existing Product", "Description", 100.0);
        Product newProduct = new Product("Updated Product", "Updated Description", 0.0);
        when(productRepository.findById(1L)).thenReturn(Optional.of(existingProduct));
        when(productRepository.save(any(Product.class))).thenReturn(newProduct);

        ResponseEntity<Product> responseEntity = productController.updateProduct(1L, newProduct);

        assertEquals(200, responseEntity.getStatusCodeValue());
        assertEquals(newProduct, responseEntity.getBody());
    }
}
