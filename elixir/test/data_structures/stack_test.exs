defmodule DataStructures.StackTest do
  use ExUnit.Case

  alias DataStructures.Stack

  setup do
    Stack.start_link()

    :ok
  end

  describe "push/1" do
    test "sets the element on top" do
      Stack.push(42)

      assert Stack.peek() == 42
    end

    test "increases the stack size" do
      previous_size = Stack.size()

      Stack.push(42)
      Stack.push("Again")

      assert Stack.size() == previous_size + 2
    end
  end

  describe "pop/0" do
    test "returns the latest element pushed" do
      Stack.push(42)
      Stack.push("Last")

      assert Stack.pop() == "Last"
    end

    test "decreases the stack size" do
      Stack.push(42)
      previous_size = Stack.size()

      Stack.pop()

      assert Stack.size() == previous_size - 1
    end

    test "returns nil when the stack is empty" do
      assert Stack.pop() == nil
    end
  end

  describe "peek/0" do
    test "returns the element on top" do
      Stack.push(42)
      Stack.push("Last")

      assert Stack.peek() == "Last"
    end

    test "doesn't change the size" do
      Stack.push(42)
      Stack.push("Last")
      previous_size = Stack.size()

      Stack.peek()

      assert Stack.size() == previous_size
    end

    test "returns nil when the stack is empty" do
      assert Stack.peek() == nil
    end
  end

  describe "empty?" do
    test "returns true when the stack is empty" do
      assert Stack.empty?()
    end

    test "returns false when there are elements" do
      Stack.push(42)
      Stack.push("Last")

      refute Stack.empty?()
    end
  end

  describe "size" do
    test "returns the number of elements" do
      Stack.push(42)
      Stack.push("Last")

      assert Stack.size() == 2
    end

    test "returns 0 if the stack is empty" do
      assert Stack.size() == 0
    end
  end
end
