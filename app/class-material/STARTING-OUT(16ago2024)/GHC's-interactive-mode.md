# GHC’s Interactive Mode

First, let’s start GHC’s interactive mode and call some functions, so we can get a very basic feel for Haskell. Open a terminal and type `ghci`.

```haskell
ghci> 2 + 15
17
ghci> 49 * 100
4900
ghci> 1892 - 1472
420
ghci> 5 / 2
2.5
```

If we use several operators in one expression, Haskell will execute them in an order that takes into account the precedence of the operators. For instance, `*` has higher precedence than `-`, so `50 * 100 - 4999` is treated as `(50 * 100) - 4999`. We can also use parentheses to explicitly specify the order of operations, like this:

```haskell
ghci> (50 * 100) - 4999
1
ghci> 50 * 100 - 4999
1
ghci> 50 * (100 - 4999) - 244950
-489900
```

One pitfall to watch out for is negative number constants. It’s always best to surround these with parentheses wherever they occur in an arithmetic expression. For example, entering `5 * -3` will make GHCi yell at you, but entering `5 * (-3)` will work just fine.


```haskell
ghci> 5 * -3
error
ghci> 5 * (-3)
-15
```

Boolean algebra is also straightforward in Haskell. Like many other programming languages, Haskell has the Boolean values `True` and `False`, and uses the `&&` operator for conjunction (Boolean and), the `||` operator for disjunction (Boolean or), and the `not` operator to negate a `True` or `False` value:

```haskell
ghci> True && False
False
ghci> True && True
True
ghci> False || True
True
ghci> not False
True
ghci> not (True && True)
False
```

We can test two values for equality or inequality with the `==` and `/=` operators, like this:

```haskell
ghci> 5 == 5
True
ghci> 1 == 0
False
ghci> 5 /= 5
False
ghci> 5 /= 4
True
ghci> "hello" == "hello"
True
```

Watch out when mixing and matching values, however! If we enter something like `5 + "llama"`, we get the following error message:

```haskell
ghci> 5 + "llama"
error
```

What GHCi is telling us here is that `"llama"` is not a number, so it does not know how to add it to `5`. The `+` operator expects both of its inputs to be numbers. On the other hand, the `==` operator works on any two items that can be compared, with one catch: they both have to be of the same type. For instance, if we tried entering `True == 5`, GHCi would complain.

> **Note:**  
> `5 + 4.0` is a valid expression, because although `4.0` isn’t an integer, `5` is sneaky and can act like either an integer or a floating-point number. In this case, `5` adapts to match the type of the floating-point value `4.0`. We’ll take a closer look at types a bit later.

# Calling Functions

You may not have realized it, but we’ve actually been using functions this whole time. For instance, `*` is a function that takes two numbers and multiplies them. As you’ve seen, we apply (or call) it by sandwiching it between the two numbers we want to multiply. This is called an `infix` function.

Most functions, however, are `prefix` functions. When calling prefix functions in Haskell, the function name comes first, then a space, then its parameters (also separated by spaces). As an example, we’ll try calling one of the most boring functions in Haskell, `succ`:

```haskell
ghci> succ 8
9
```

The `succ` function takes one parameter that can be anything that has a well-defined successor and returns that value. The successor of an integer value is just the next higher number.

Now let’s call two prefix functions that take multiple parameters, `min` and `max`:

```haskell
ghci> min 9 10
9
ghci> min 3.4 3.2
3.2
ghci> max 100 101
101
```

The `min` and `max` functions each take two parameters that can be put in some order (like numbers!), and they return the one that’s smaller or larger, respectively.

Function application has the highest precedence of all the operations in Haskell. In other words, these two statements are equivalent:

```haskell
ghci> succ 9 + max 5 4 + 1
16
ghci> (succ 9) + (max 5 4) + 1
16
```

This means that if we want to get the successor of `9 * 10`, we couldn’t simply write:

```haskell
ghci> succ 9 * 10
100
```

Because of the precedence of operations, this would evaluate as the successor of 9 (which is 10) multiplied by 10, yielding 100. To get the result we want, we need to instead enter:

```haskell
ghci> succ (9 * 10)
91
```

This returns 91.

If a function takes two parameters, we can also call it as an infix function by surrounding its name with backticks (\`). For instance, the `div` function takes two integers and executes an integral division, as follows:

```haskell
ghci> div 92 10
```

However, when we call it like that, there may be some confusion as to which number is being divided by which. By using backticks, we can call it as an infix function, and suddenly it seems much clearer:

```haskell
ghci> 92 `div` 10
```

Many programmers who are used to imperative languages tend to stick to the notion that parentheses should denote function application, and they have trouble adjusting to the Haskell way of doing things. Just remember, if you see something like `bar (bar 3)`, it means that we’re first calling the `bar` function with 3 as the parameter, then passing that result to the `bar` function again. The equivalent expression in C would be something like `bar(bar(3))`.