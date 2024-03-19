package com.bootexample4.products.model;

import org.junit.Before;
import org.junit.Test;
import static org.assertj.core.api.Assertions.assertThat;

public class ProductGetDescriptionTest {
    private Product product;

    @Before
    public void setUp() {
        product = new Product();
    }

    @Test
    public void testDescriptionIsNotNull() {
        // Arrange
        String expectedDescription = "This is a test description";
        product.setDescription(expectedDescription);

        // Act
        String actualDescription = product.getDescription();

        // Assert
        assertThat(actualDescription).isEqualTo(expectedDescription);
    }

    @Test
    public void testDescriptionIsNull() {
        // Arrange
        product.setDescription(null);

        // Act
        String actualDescription = product.getDescription();

        // Assert
        assertThat(actualDescription).isNull();
    }

    @Test
    public void testDescriptionIsEmptyString() {
        // Arrange
        product.setDescription("");

        // Act
        String actualDescription = product.getDescription();

        // Assert
        assertThat(actualDescription).isEmpty();
    }
}
