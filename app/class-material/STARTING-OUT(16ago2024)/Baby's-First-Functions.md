# Baby’s First Functions

### Defining a Simple Function

The syntax of a function definition in Haskell is similar to that of a function call: the function name is followed by parameters, which are separated by spaces. After the parameter list, the `=` operator is used, followed by the code that makes up the body of the function.

For example, let’s write a simple function that takes a number and multiplies it by two:

```haskell
doubleMe x = x + x
```

Save this file as `baby.hs`. Now run GHCi, making sure that `baby.hs` is in your current directory. Once in GHCi, you can load the file and start using your new function:

```haskell
ghci> :l baby
ghci> doubleMe 9
ghci> doubleMe 8.3
```

Because the `+` operator works on integers as well as on floating-point numbers (and indeed on anything that can be considered a number), our function works with any of these types.

### Creating a Function that Takes Multiple Parameters

Now, let’s make a function that takes two numbers, multiplies each by two, and then adds them together. Append the following code to `baby.hs`:

```haskell
doubleUs x y = x*2 + y*2
```

Save the file, and enter `:r` in GHCi to load your new function. Testing this function yields predictable results:

```haskell
ghci> doubleUs 4 9
ghci> doubleUs 2.3 34.2
ghci> doubleUs 28 88 + doubleMe 123
```

Functions that you define can also call each other. With that in mind, we could redefine `doubleUs` in the following way:

```haskell
doubleUs x y = doubleMe x + doubleMe y
```

This is a very simple example of a common pattern you will see when using Haskell: basic, obviously correct functions can be combined to form more complex functions. This is a great way to avoid code repetition.

### Conditional Logic in Functions

Let’s write a function that multiplies a number by 2, but only if that number is less than or equal to 100 (because numbers bigger than 100 are big enough as it is!):

```haskell
doubleSmallNumber x = if x > 100
                      then x
                      else x*2
```

This example introduces Haskell’s `if` statement. You’re probably already familiar with `if` statements from other languages, but what makes Haskell’s unique is that the `else` part is mandatory.

Haskell programs are a collection of functions, and functions are used to transform data values into result values. Every function should return some value, which can in turn be used by another function. Since every function has to return something, this implies that every `if` has to have a corresponding `else`.

Let’s say we want a function that adds one to every number that would be produced by our previous `doubleSmallNumber` function. The body of this new function would look like this:

```haskell
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1
```

Note the placement of the parentheses. If we had omitted them, the function would only add one if `x` is less than or equal to 100.

### Naming Conventions in Haskell

In Haskell, functions can’t begin with capital letters. For example, consider the following function:

```haskell
conanO'Brien = "It's a-me, Conan O'Brien!"
```

There are two things to note here:
1. The function name does not begin with a capital letter.
2. This function doesn’t take any parameters. When a function doesn’t take any parameters, we usually call it a definition or a name.

Since we cannot change what names (or functions) mean once we have defined them, the function `conanO'Brien` and the string `"It's a-me, Conan O'Brien!"` can be used interchangeably.