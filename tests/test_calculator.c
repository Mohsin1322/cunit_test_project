#include "../unity/unity.h"
#include "../src/calculator.h"

void setUp(void) {
    // Set up before each test
}

void tearDown(void) {
    // Clean up after each test
}

void test_add_positive_numbers(void) {
    TEST_ASSERT_EQUAL(5, add(2, 3));
    TEST_ASSERT_EQUAL(10, add(7, 3));
}

void test_add_negative_numbers(void) {
    TEST_ASSERT_EQUAL(-5, add(-2, -3));
    TEST_ASSERT_EQUAL(0, add(-5, 5));
}

void test_subtract(void) {
    TEST_ASSERT_EQUAL(2, subtract(5, 3));
    TEST_ASSERT_EQUAL(-2, subtract(3, 5));
}

void test_multiply(void) {
    TEST_ASSERT_EQUAL(15, multiply(3, 5));
    TEST_ASSERT_EQUAL(0, multiply(0, 5));
}

void test_divide(void) {
    TEST_ASSERT_EQUAL(3, divide(15, 5));
    TEST_ASSERT_EQUAL(2, divide(10, 5));
}

void test_divide_by_zero(void) {
    TEST_ASSERT_EQUAL(-1, divide(10, 0));
}

int main(void) {
    UNITY_BEGIN();
    
    RUN_TEST(test_add_positive_numbers);
    RUN_TEST(test_add_negative_numbers);
    RUN_TEST(test_subtract);
    RUN_TEST(test_multiply);
    RUN_TEST(test_divide);
    RUN_TEST(test_divide_by_zero);
    
    return UNITY_END();
}
