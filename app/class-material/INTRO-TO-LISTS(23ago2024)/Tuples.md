# Tuples

Tuples are used to store several heterogeneous elements as a single value. In some ways, tuples are a lot like lists. However, there are some fundamental differences.

First, as mentioned, tuples are heterogeneous. This means that a single tuple can store elements of several different types. Second, tuples have a fixed size—you need to know how many elements you’ll be storing ahead of time.

Tuples are surrounded by parentheses, and their components are separated by commas:

```haskell
ghci> (1, 3)
(1,3)
ghci> (3, 'a', "hello")
(3,'a',"hello")
ghci> (50, 50.4, "hello", 'b')
(50,50.4,"hello",'b')
```

## Using Tuples

As an example of when tuples would be useful, let’s think about how we’d represent a two-dimensional vector in Haskell. One way would be to use a two-item list, in the form of `[x,y]`. But suppose we wanted to make a list of vectors, to represent the corners of a two-dimensional shape in a coordinate plane. We could just create a list of lists, like this: `[[1,2],[8,11],[4,5]]`.

The problem with this method, however, is that we could also make a list like `[[1,2],[8,11,5],[4,5]]` and try to use it in the place of a list of vectors. Even though it doesn’t make sense as a list of vectors, Haskell has no problem with this list appearing wherever the previous list can, since both are of the same type (a list of lists of numbers). This could make it more complicated to write functions to manipulate vectors and shapes.

In contrast, a tuple of size two (also called a pair) and a tuple of size three (also called a triple) are treated as two distinct types, which means a list can’t be composed of both pairs and triples. This makes tuples much more useful for representing vectors.

We can change our vectors to tuples by surrounding them with parentheses instead of square brackets, like this: `[(1,2),(8,11),(4,5)]`. Now, if we try to mix pairs and triples, we get an error, like this:

```haskell
ghci> [(1,2),(8,11,5),(4,5)]
Couldn't match expected type `(t, t1)' against inferred type `(t2, t3, t4)'
In the expression: (8, 11, 5)
In the expression: [(1, 2), (8, 11, 5), (4, 5)]
In the definition of `it': it = [(1, 2), (8, 11, 5), (4, 5)]
```

Haskell also considers tuples that have the same length but contain different types of data to be distinct types of tuples. For example, you can’t make a list of tuples like `[(1,2),("One",2)]`, because the first is a pair of numbers, and the second is a pair containing a string followed by a number.

Tuples can be used to easily represent a wide variety of data. For instance, if we wanted to represent someone’s name and age in Haskell, we could use a triple: `("Christopher", "Walken", 55)`.

Remember, tuples are of a fixed size—you should only use them when you know in advance how many elements you’ll need. The reason tuples are so rigid in this way is that, as mentioned, the size of a tuple is treated as part of its type. Unfortunately, this means that you can’t write a general function to append an element to a tuple—you’d have to write a function for appending to a pair (to produce a triple), another one for appending to a triple (to produce a 4-tuple), another one for appending to a 4-tuple, and so on.

Like lists, tuples can be compared with each other if their components can be compared. However, unlike lists, you can’t compare two tuples of different sizes.

Although there are singleton lists, there’s no such thing as a singleton tuple. It makes sense when you think about it: a singleton tuple’s properties would simply be those of the value it contains, so distinguishing a new type wouldn’t give us any benefit.

## Using Pairs

Storing data in pairs is very common in Haskell, and there are some useful functions in place to manipulate them. Here are two functions that operate on pairs:

- **`fst`** takes a pair and returns its first component:

    ```haskell
    ghci> fst (8, 11)
    8
    ghci> fst ("Wow", False)
    "Wow"
    ```

- **`snd`** takes a pair and—surprise!—returns its second component:

    ```haskell
    ghci> snd (8, 11)
    11
    ghci> snd ("Wow", False)
    False
    ```

**NOTE:** These functions only operate on pairs. They won’t work on triples, 4-tuples, 5-tuples, etc. We’ll go over extracting data from tuples in different ways a bit later.

The `zip` function is a cool way to produce a list of pairs. It takes two lists, then “zips” them together into one list by joining the matching elements into pairs. It’s a really simple function, but it can be very useful when you want to combine two lists in a particular way or traverse two lists simultaneously. Here’s a demonstration:

```haskell
ghci> zip [1,2,3,4,5] [5,5,5,5,5]
[(1,5),(2,5),(3,5),(4,5),(5,5)]
ghci> zip [1..5] ["one", "two", "three", "four", "five"]
[(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]
```

Notice that because pairs can have different types in them, `zip` can take two lists that contain elements of different types. But what happens if the lengths of the lists don’t match?

```haskell
ghci> zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]
[(5,"im"),(3,"a"),(2,"turtle")]
```

As you can see in the above example, only as much of the longer list is used as needed—the rest is simply ignored. And because Haskell uses lazy evaluation, we can even zip finite lists with infinite lists:

```haskell
ghci> zip [1..] ["apple", "orange", "cherry", "mango"]
[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]
```