# Introduction
The goal of this repository is to contain solutions to algorithm problems such as the one that can be found on Hackerrank, Leetcode or even on books like Cracking The Code Interview.

The solutions will be available in different programming languages, in order to be able to compare between the best parts of each language and how we can take advantage of them to solve different types of problems

##  Data Structures
In order to simplify the resolution of the problems, we will also implement different data structures like Stacks, Trees, Linked Lists, etc that may be helpful for most of the problems. Here you can find the interface for the data structures that have been implemented so far:

### Stack
A stack is an abstract data type that serves as a collection of elements. The order in which elements come off a stack gives rise to its alternative name, LIFO (last in, first out). The name "stack" for this type of structure comes from the analogy to a set of physical items stacked on top of each other, which makes it easy to take an item off the top of the stack, while getting to an item deeper in the stack may require taking off multiple other items first

The implemented operations are:

* `push(value) -> null`: Inserts an item on the top of the stack
* `pop() -> value`: Removes the item at the top of the stack and returns it
* `peek() -> value`: Returns the item at the top of the stack without removing it
* `is_empty() -> boolean`: Indicates if the stack is empty or not. _Note: In Ruby and Elixir this method is called `empty?`_
* `size() -> integer`: Returns the number of elements in the stack

**Current implementations**:
* [Python](python/src/data_structures/stack.py)
* [Elixir](elixir/lib/data_structures/stack.ex)
* [Ruby](ruby/lib/data_structures/stack.rb)

### Node
A node is a generic data structure formed by an element and a pointer to another Node. It's main goal is to be used to represent the values in a Linked List

The implemented operations are:
* `value -> value`: Returns the value of the element contained in the node
* `next_node -> Node || null`: A pointer to the node that follows this one in the linked list. If the node is the last one, returns `null`.

**Current implementations**:
* [Python](python/src/data_structures/node.py)
