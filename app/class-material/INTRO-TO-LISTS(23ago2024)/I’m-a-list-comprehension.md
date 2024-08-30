
# I’m a List Comprehension

List comprehensions are a way to filter, transform, and combine lists. They’re very similar to the mathematical concept of set comprehensions.

Set comprehensions are normally used for building sets out of other sets. An example of a simple set comprehension is: `{2 · x | x ∈ N, x ≤ 10}`. The exact syntax used here isn’t crucial—what’s important is that this statement says, “take all the natural numbers less than or equal to 10, multiply each one by 2, and use these results to create a new set.”

If we wanted to write the same thing in Haskell, we could do something like this with list operations: `take 10 [2,4..]`. However, we could also do the same thing using list comprehensions, like this:

```haskell
ghci> [x*2 | x <- [1..10]]
[2,4,6,8,10,12,14,16,18,20]
```

Let’s take a closer look at the list comprehension in this example to better understand list comprehension syntax. In `[x*2 | x <- [1..10]]`, we say that we draw our elements from the list `[1..10]`. `[x <- [1..10]]` means that x takes on the value of each element that is drawn from `[1..10]`. In other words, we bind each element from `[1..10]` to x. The part before the vertical pipe (`|`) is the output of the list comprehension. The output is the part where we specify how we want the elements that we’ve drawn to be reflected in the resulting list. In this example, we say that we want each element that is drawn from the list `[1..10]` to be doubled.

This may seem longer and more complicated than the first example, but what if we want to do something more complex than just doubling these numbers? This is where list comprehensions really come in handy.

For example, let’s add a condition (also called a predicate) to our comprehension. Predicates go at the end of the list comprehension and are separated from the rest of the comprehension by a comma. Let’s say we want only the elements which, after being doubled, are greater than or equal to 12:

```haskell
ghci> [x*2 | x <- [1..10], x*2 >= 12]
[12,14,16,18,20]
```

What if we want all numbers from 50 to 100 whose remainder when divided by 7 is 3? Easy:

```haskell
ghci> [ x | x <- [50..100], x `mod` 7 == 3]
[52,59,66,73,80,87,94]
```
> **Note:**  
> Weeding out parts of lists using predicates is also called filtering. 

Now for another example. Let’s say we want a comprehension that replaces every odd number greater than 10 with `"BANG!"`, and every odd number less than 10 with `"BOOM!"`. If a number isn’t odd, we throw it out of our list. For convenience, we’ll put that comprehension inside a function so we can easily reuse it:

```haskell
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
```

The odd function returns True when passed an odd number, otherwise it returns False. The element is included in the list only if all the predicates evaluate to True.

```haskell
ghci> boomBangs [7..13]
["BOOM!","BOOM!","BANG!","BANG!"]
```

We can include as many predicates as we want, all separated by commas. For instance, if we wanted all numbers from 10 to 20 that are not 13, 15, or 19, we’d do:

```haskell
ghci> [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]
[10,11,12,14,16,17,18,20]
```

Not only can we have multiple predicates in list comprehensions, we can also draw values from several lists. When drawing values from several lists, every combination of elements from these lists is reflected in the resulting list:

```haskell
ghci> [x+y | x <- [1,2,3], y <- [10,100,1000]]
[11,101,1001,12,102,1002,13,103,1003]
```

Here, x is drawn from `[1,2,3]` and y is drawn from `[10,100,1000]`. These two lists are combined in the following way. First, x becomes 1, and while x is 1, y takes on every value from `[10,100,1000]`. Because the output of the list comprehension is `x+y`, the values `11, 101, and 1001` are added to the beginning of the resulting list (1 is added to `10, 100, and 1000`). After that, x becomes 2 and the same thing happens, resulting in the elements `12, 102, and 1002` being added to the resulting list. The same goes when x draws the value 3. In this manner, each element x from `[1,2,3]` is combined with each element y from `[10,100,1000]` in all possible ways, and `x+y` is used to make the resulting list from those combinations.

Here’s another example: if we have two lists, `[2,5,10]` and `[8,10,11]`, and we want to get the products of all possible combinations of numbers in those lists, we could use the following comprehension:

```haskell
ghci> [ x*y | x <- [2,5,10], y <- [8,10,11]]
[16,20,22,40,50,55,80,100,110]
```

As expected, the length of the new list is 9. Now, what if we wanted all possible products that are more than 50? We can just add another predicate:

```haskell
ghci> [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
[55,80,100,110]
```

For epic hilarity, let’s make a list comprehension that combines a list of adjectives and a list of nouns.

```haskell
ghci> let nouns = ["hobo","frog","pope"]
ghci> let adjectives = ["lazy","grouchy","scheming"]
ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog",
"grouchy pope","scheming hobo","scheming frog","scheming pope"]
```

We can even use list comprehensions to write our own version of the `length` function! We’ll call it `length'`. This function will replace every element in a list with 1, then add them all up with `sum`, yielding the length of the list.

```haskell
length' xs = sum [1 | _ <- xs]
```

Here we use underscore (`_`) as a temporary variable to store the items as we draw them from the input list, since we don’t actually care about the values.

Remember, strings are lists too, so we can use list comprehensions to process and produce strings. Here’s an example of a function that takes a string and removes all the lowercase letters from it:

```haskell
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
```

The predicate here does all the work. It says that the character will be included in the new list only if it’s an element of the list `['A'..'Z']`. We can load the function in GHCi and test it out:

```haskell
ghci> removeNonUppercase "Hahaha! Ahahaha!"
"HA"
ghci> removeNonUppercase "IdontLIKEFROGS"
"ILIKEFROGS"
```

You can also create nested list comprehensions if you’re operating on lists that contain lists. For example, let’s take a list that contains several lists of numbers and remove all the odd numbers without flattening the list:

```haskell
ghci> let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
ghci> [ [ x | x <- xs, even x ] | xs <- xxs]
[[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]
```

Here the output of the outer list comprehension is another list comprehension. A list comprehension always results in a list of something, so we know that the result here will be a list of lists of numbers.

> **Note:**  
> You can split list comprehensions across several lines to improve their readability. If you’re not in GHCi, this can be a great help, especially when dealing with nested comprehensions.