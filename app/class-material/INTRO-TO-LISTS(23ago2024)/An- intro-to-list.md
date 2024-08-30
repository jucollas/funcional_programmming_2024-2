# An Intro to Lists

Lists in Haskell are homogeneous data structures, which means they store several elements of the same type. We can have a list of integers or a list of characters, for example, but we can’t have a list made up of both integers and characters.

Lists are surrounded by square brackets, and the list values are separated by commas:

```haskell
ghci> let lostNumbers = [4,8,15,16,23,42]
ghci> lostNumbers
[4,8,15,16,23,42]
```

> **NOTE:** Use the `let` keyword to define a name in GHCi. Entering `let a = 1` in GHCi is equivalent to writing `a = 1` in a script, then loading it with `:l`.

## Concatenation

One of the most common operations when working with lists is concatenation. In Haskell, this is done using the `++` operator:

```haskell
ghci> [1,2,3,4] ++ [9,10,11,12]
[1,2,3,4,9,10,11,12]

ghci> "hello" ++ " " ++ "world"
"hello world"

ghci> ['w','o'] ++ ['o','t']
"woot"
```

> **NOTE:** In Haskell, strings are really just lists of characters. For example, the string `"hello"` is actually the same as the list `['h','e','l','l','o']`. Because of this, we can use list functions on strings, which is really handy.

Be careful when repeatedly using the `++` operator on long strings. When you put together two lists, Haskell has to walk through the entire first list (the one on the left side of `++`). That’s not a problem when dealing with smaller lists, but appending something to the end of a list with fifty million entries is going to take a while.

However, adding something to the beginning of a list is a nearly instantaneous operation. We do this with the `:` operator (also called the cons operator):

```haskell
ghci> 'A':" SMALL CAT"
"A SMALL CAT"

ghci> 5:[1,2,3,4,5]
[5,1,2,3,4,5]
```

Notice how in the first example, `:` takes a character and a list of characters (a string) as its arguments. Similarly, in the second example, `:` takes a number and a list of numbers. The first argument to the `:` operator always needs to be a single item of the same type as the values in the list it’s being added to.

The `++` operator, on the other hand, always takes two lists as arguments. Even if you’re only adding a single element to the end of a list with `++`, you still have to surround that item with square brackets, so Haskell will treat it like a list:

```haskell
ghci> [1,2,3,4] ++ [5]
[1,2,3,4,5]
```

Writing `[1,2,3,4] ++ 5` is wrong, because both parameters to `++` should be lists, and `5` isn’t a list; it’s a number.

Interestingly, in Haskell, `[1,2,3]` is just syntactic sugar for `1:2:3:[]`. `[]` is an empty list. If we prepend `3` to that, it becomes `[3]`. Then if we prepend `2` to that, it becomes `[2,3]`, and so on.

> **NOTE:** `[]`, `[[]]`, and `[[],[],[]]` are all different things. The first is an empty list, the second is a list that contains one empty list, and the third is a list that contains three empty lists.