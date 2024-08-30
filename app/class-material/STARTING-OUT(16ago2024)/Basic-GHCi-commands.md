## GHCi Commands: `:l`, `:r`, `:q`, and `:?`

### `:l` / `:load` (Load)
- **Usage**: `:l <filename>` or `:load <filename>`
- **Description**: The `:l` (or `:load`) command is used to load a Haskell source file into the GHCi interpreter. Once the file is loaded, you can interact with the functions and definitions from the file directly in the interpreter.
- **Example**: To load a file named `MyProgram.hs`, you would use:
  ```haskell
  :l MyProgram.hs
  ```
  or
  ```haskell
  :load MyProgram.hs
  ```

### `:r` / `:reload` (Reload)
- **Usage**: `:r` or `:reload`
- **Description**: The `:r` (or `:reload`) command reloads the current file that is loaded in GHCi. This is useful after making changes to the file and wanting to see the updated behavior without restarting GHCi.
- **Example**: After modifying `MyProgram.hs`, you can reload it with:
  ```haskell
  :r
  ```
  or
  ```haskell
  :reload
  ```

### `:q` / `:quit` (Quit)
- **Usage**: `:q` or `:quit`
- **Description**: The `:q` (or `:quit`) command is used to quit the GHCi interpreter. This will terminate your current GHCi session.
- **Example**: To exit GHCi, simply type:
  ```haskell
  :q
  ```
  or
  ```haskell
  :quit
  ```

### `:?` / `:help` (Help)
- **Usage**: `:?` or `:help`
- **Description**: The `:?` (or `:help`) command provides a list of all available commands in GHCi, along with brief descriptions. It's a handy reference if you forget how to use a particular command or want to discover new ones.
- **Example**: To see the help menu, type:
  ```haskell
  :?
  ```
  or
  ```haskell
  :help
  ```

These commands are essential for effectively navigating and utilizing the GHCi interpreter, allowing you to load, reload, and exit the interpreter, as well as access help when needed.