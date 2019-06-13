import pytest

from src.data_structures.stack import Stack


# PUSH
def test_push_sets_the_element_on_top():
    stack = Stack()
    
    stack.push(42)
    
    assert stack.peek() == 42

def test_push_increases_the_stack_size():
    stack = Stack()
    previous_size = stack.size

    stack.push(42)

    assert stack.size == (previous_size + 1)

# POP
def test_pop_returns_the_latest_element_pushed():
    stack = Stack()
    stack.push("First")
    stack.push(42)

    assert stack.pop() == 42

def test_pop_decreases_the_stack_size():
    stack = Stack()
    stack.push(42)
    previous_size = stack.size

    stack.pop()

    assert stack.size == (previous_size - 1)

def test_pop_on_empty_stack_returns_none():
    stack = Stack()

    assert stack.pop() == None

# PEEK
def test_peek_returns_the_element_on_top():
    stack = Stack()
    stack.push(42)

    assert stack.peek() == 42

def test_peek_does_not_change_the_stack_size():
    stack = Stack()
    stack.push(42)
    previous_size = stack.size

    stack.peek()

    assert stack.size == previous_size

def test_peek_on_empty_stack_returns_none():
    stack = Stack()
    
    assert stack.peek() == None

# IS_EMPTY
def test_is_empty_returns_true_on_empty_stack():
    stack = Stack()

    assert stack.is_empty()

def test_is_empty_returns_false_on_stack_with_elements():
    stack = Stack()
    stack.push(42)

    assert not stack.is_empty()

# SIZE
def test_size_returns_the_number_of_elements_in_the_stack():
    stack = Stack()
    stack.push(42)
    stack.push(42)
    stack.push(42)

    assert stack.size == 3

def test_size_on_empty_stack_returns_zero():
    stack = Stack()

    assert stack.size == 0


# __REPR__
def test_str_prints_the_stack_and_its_elements():
    stack = Stack()
    stack.push(42)
    stack.push("Second element")
    stack.push(True)

    assert str(stack) == "Stack(True, 'Second element', 42)"
