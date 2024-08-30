
# Accessing List Elements

If you want to get an element of a list by index, use the `!!` operator. As with most programming languages, the indices start at 0:

```haskell
ghci> "Steve Buscemi" !! 6
'B'

ghci> [9.4,33.2,96.2,11.2,23.25] !! 1
33.2
```

However, if you try to get the sixth element from a list that only has four elements, you’ll get an error, so be careful!

## Lists Inside Lists

Lists can contain lists as elements, and lists can contain lists that contain lists, and so on...

```haskell
ghci> let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
ghci> b
[[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]

ghci> b ++ [[1,1,1,1]]
[[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3],[1,1,1,1]]

ghci> [6,6,6]:b
[[6,6,6],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]

ghci> b !! 2
[1,2,2,3,4]
```

Lists within a list can be of different lengths, but they can’t be of different types. Just like you can’t have a list that has some characters and some numbers as elements, you also can’t have a list that contains some lists of characters and some lists of numbers.

## Comparing Lists

Lists can be compared if the items they contain can be compared. When using `<`, `<=`, `>=`, and `>` to compare two lists, they are compared in lexicographical order. This means that first the two list heads are compared, and if they’re equal, the second elements are compared. If the second elements are also equal, the third elements are compared, and so on, until differing elements are found. The order of the two lists is determined by the order of the first pair of differing elements.

For example, when we evaluate `[3,4,2] < [3,4,3]`, Haskell sees that `3` and `3` are equal, so it compares `4` and `4`. Those two are also equal, so it compares `2` and `3`. `2` is smaller than `3`, so it comes to the conclusion that the first list is smaller than the second one. The same goes for `<=`, `>=`, and `>`.

```haskell
ghci> [3,2,1] > [2,1,0]
True

ghci> [3,2,1] > [2,10,100]
True

ghci> [3,4,2] < [3,4,3]
True

ghci> [3,4,2] > [2,4]
True

ghci> [3,4,2] == [3,4,2]
True
```

Also, a nonempty list is always considered to be greater than an empty one. This makes the ordering of two lists well defined in all cases, including when one is a proper initial segment of the other.