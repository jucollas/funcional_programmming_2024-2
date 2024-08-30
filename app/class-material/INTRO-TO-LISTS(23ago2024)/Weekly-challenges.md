# Challenges

## 1. Sum of Even Numbers
Write a Haskell expression that generates a list of all even numbers from 1 to 100 and then computes the sum of those numbers.

>**Hint:** Use list comprehension to generate the list.

---

## 2. Generate a List of Pairs
Create a list of all pairs `(a, b)` where `a` is an integer from 1 to 5, and `b` is an integer from 6 to 10. Each pair should contain one element from each range.

>**Hint:** Use list comprehension and the `<-` operator.

---

## 3. Filter Tuples by Sum
Given a list of tuples `[(1,2), (3,4), (5,6), (7,8)]`, write a Haskell expression that filters out the tuples where the sum of the two elements is greater than 10.

>**Hint:** Use `filter` along with a lambda function.

---

## 4. Combine Two Lists
Given two lists `[1,2,3]` and `[4,5,6]`, combine them into a list of pairs `[(1,4), (2,5), (3,6)]`.

>**Hint:** Use the `zip` function.

---

## 5. Find the First Odd Number Greater Than 20
Write a Haskell expression that finds the first odd number greater than 20 in the list `[1..100]`.

>**Hint:** Use `filter` and `head`.

---

## 6. Length of a String List
Given a list of strings `["apple", "banana", "cherry"]`, write a Haskell expression that returns a list of the lengths of these strings.

>**Hint:** Use the `map` function.

---

## 7. Right Triangles
Find all the right triangles with integer side lengths `(a, b, c)` where `a`, `b`, and `c` are all less than or equal to 10, and the perimeter of the triangle is 24.

>**Hint:** Use list comprehension to generate the triangles and filter out those that don’t satisfy the Pythagorean theorem.

---

## 8. Find Maximum Element in a List
Write a Haskell expression that finds the maximum element in the list `[10, 20, 5, 15, 25]` without using recursion.

>**Hint:** Use the `maximum` function.

---

## 9. Create a List of Squares
Generate a list of the squares of the numbers from 1 to 20.

>**Hint:** Use list comprehension.

---

## 10. Count Elements in a List
Write a Haskell expression that counts how many elements in the list `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` are greater than 5.

>**Hint:** Use `filter` and `length`.

---

## Bonus: Prime Numbers up to a Range
Write a Haskell expression that generates a list of all prime numbers up to a given range `n`.

>**Hint:** Use a list comprehension to filter out the prime numbers. You can determine if a number is prime by ensuring it has no divisors other than 1 and itself.
