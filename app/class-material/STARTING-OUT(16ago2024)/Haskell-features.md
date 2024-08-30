# What is Haskell?

Haskell is a purely functional programming language. In imperative programming languages, you give the computer a sequence of tasks, which it then executes. While executing them, the computer can change state. For instance, you can set the variable `a` to 5 and then do some stuff that might change the value of `a`. There are also flow-control structures for executing instructions several times, such as `for` and `while` loops.

## Purely Functional Programming

Purely functional programming is different. You don’t tell the computer what to do—you tell it what stuff is. For instance, you can tell the computer that the factorial of a number is the product of every integer from 1 to that number or that the sum of a list of numbers is the first number plus the sum of the remaining numbers. You can express both of these operations as functions.

In functional programming, you can’t set a variable to one value and then set it to something else later on. If you say `a` is 5, you can’t just change your mind and say it’s something else. After all, you said it was 5. (What are you, some kind of liar?)

## Referential Transparency

In purely functional languages, a function has no side effects. The only thing a function can do is calculate something and return the result. At first, this seems limiting, but it actually has some very nice consequences. If a function is called twice with the same parameters, it’s guaranteed to return the same result both times. This property is called referential transparency. It lets the programmer easily deduce (and even prove) that a function is correct. You can then build more complex functions by gluing these simple functions together.

## Lazy Evaluation

Haskell is lazy. This means that, unless specifically told otherwise, Haskell won’t execute functions until it needs to show you a result. This is made possible by referential transparency. If you know that the result of a function depends only on the parameters that function is given, it doesn’t matter when you actually calculate the result of the function. Haskell, being a lazy language, takes advantage of this fact and defers actually computing results for as long as possible. Once you want your results to be displayed, Haskell will do just the bare minimum computation required to display them. Laziness also allows you to make seemingly infinite data structures, because only the parts of the data structures that you choose to display will actually be computed.

### Example of Lazy Evaluation

Let’s look at an example of Haskell’s laziness. Say you have a list of numbers, `xs = [1,2,3,4,5,6,7,8]`, and a function called `doubleMe` that doubles every element and returns the result as a new list. If you want to multiply your list by 8, your code might look something like this:

```haskell
doubleMe(doubleMe(doubleMe(xs)))
```

An imperative language would probably pass through the list once, make a copy, and then return it. It would then pass through the list another two times, making copies each time, and return the result.

In a lazy language, calling `doubleMe` on a list without forcing it to show you the result just makes the program tell you, “Yeah yeah, I’ll do it later!” Once you want to see the result, the first `doubleMe` calls the second one and says it wants the result immediately. Then the second one says the same thing to the third one, and the third one reluctantly gives back a doubled `1`, which is `2`. The second `doubleMe` receives that and returns `4` to the first one. The first `doubleMe` then doubles this result and tells you that the first element in the final resulting list is `8`. Because of Haskell’s laziness, the `doubleMe` calls pass through the list just once, and only when you really need that to happen.

## Static Typing

Haskell is statically typed. This means that when you compile your program, the compiler knows which piece of code is a number, which is a string, and so on. Static typing means that a lot of possible errors can be caught at compile time. If you try to add together a number and a string, for example, the compiler will whine at you.

## Type Inference

Haskell uses a very good type system that has type inference. This means that you don’t need to explicitly label every piece of code with a type because Haskell’s type system can intelligently figure it out. For example, if you say `a = 5 + 4`, you don’t need to tell Haskell that `a` is a number—it can figure that out by itself. Type inference makes it easier for you to write code that’s more general. If you write a function that takes two parameters and adds them together, but you don’t explicitly state their type, the function will work on any two parameters that act like numbers.

## Elegance and Conciseness

Haskell is elegant and concise. Because it uses a lot of high-level concepts, Haskell programs are usually shorter than their imperative equivalents. Shorter programs are easier to maintain and have fewer bugs.

## History

Haskell was created in the late 1980s by a committee of researchers, including Simon Peyton Jones, John Hughes, and Philip Wadler, to standardize functional programming languages. Named after logician Haskell Curry, it was designed to be a purely functional language with lazy evaluation, strong static typing, and type inference. The first version was published in 1990, with Haskell 98 being the most significant milestone, defining a stable version for teaching and research. Haskell remains influential in both academia and industry for its powerful type system and expressive syntax.