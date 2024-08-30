# Haskell Challenges (16/Ago/2024)

## Challenge 1: Age Verification

**Objective:**  
Create a function in Haskell that checks if a person is of legal age (18 years or older).

**Instructions:**

1. **Define the function `isLegalAge`:**
   - The function should take an integer as an argument, representing the person's age, and return `True` if the person is 18 or older, and `False` otherwise.

   ```haskell
   isLegalAge age = ...
   ```

2. **Test the function:**
   - Write several test cases in GHCi to verify its behavior.

   **Example usage:**

   ```haskell
   ghci> isLegalAge 20
   True

   ghci> isLegalAge 17
   False

   ghci> isLegalAge 18
   True
   ```

---

## Challenge 2: Exam Grading

**Objective:**  
Create a function in Haskell that assigns a letter grade (A, B, C, D, or F) based on a numeric score.

**Instructions:**

1. **Define the function `grade`:**
   - The function should take an integer representing a score (0 to 100) and return a letter grade according to the following criteria:
     - A: 90-100
     - B: 80-89
     - C: 70-79
     - D: 60-69
     - F: Below 60

   ```haskell
   grade score = ...
   ```

2. **Test the function:**
   - Write several test cases in GHCi to verify its behavior.

   **Example usage:**

   ```haskell
   ghci> grade 85
   'B'

   ghci> grade 92
   'A'

   ghci> grade 58
   'F'
   ```

---

## Challenge 3: Even or Odd

**Objective:**  
Create a function in Haskell that determines if a number is even or odd.

**Instructions:**

1. **Define the function `isEven`:**
   - The function should take an integer as an argument and return `True` if the number is even, or `False` if it is odd.

   ```haskell
   isEven x = ...
   ```

2. **Test the function:**
   - Write several test cases in GHCi to verify its behavior.

   **Example usage:**

   ```haskell
   ghci> isEven 4
   True

   ghci> isEven 7
   False

   ghci> isEven 0
   True
   ```

---

## Challenge 4: Number Classification

**Objective:**  
Create a function in Haskell that classifies a number as positive, negative, or zero.

**Instructions:**

1. **Define the function `classifyNumber`:**
   - The function should take a number as an argument and return `1` if it is positive, `-1` if it is negative, and `0` if it is zero.

   ```haskell
   classifyNumber x = ...
   ```

2. **Test the function:**
   - Write several test cases in GHCi to verify its behavior.

   **Example usage:**

   ```haskell
   ghci> classifyNumber 10
   1

   ghci> classifyNumber (-5)
   -1

   ghci> classifyNumber 0
   0
   ```

---

## Challenge 5: Number Comparison

**Objective:**  
Create a function in Haskell that compares two numbers and returns `True` if the first number is greater than the second, and `False` otherwise.

**Instructions:**

1. **Define the function `isGreater`:**
   - The function should take two numbers as arguments and return `True` if the first is greater than the second, and `False` otherwise.

   ```haskell
   isGreater x y = ...
   ```

2. **Test the function:**
   - Write several test cases in GHCi to verify its behavior.

   **Example usage:**

   ```haskell
   ghci> isGreater 10 5
   True

   ghci> isGreater 3 8
   False

   ghci> isGreater 7 7
   False
   ```

---

## Challenge 6: Maximum of Three Numbers

**Objective:**  
Create a function in Haskell that determines the maximum of three numbers.

**Instructions:**

1. **Define the function `maxOfThree`:**
   - The function should take three numbers as arguments and return the largest of them.

   ```haskell
   maxOfThree x y z = ...
   ```

2. **Test the function:**
   - Write several test cases in GHCi to verify its behavior.

   **Example usage:**

   ```haskell
   ghci> maxOfThree 10 5 8
   10

   ghci> maxOfThree 3 7 2
   7

   ghci> maxOfThree 4 4 4
   4
   ```

---