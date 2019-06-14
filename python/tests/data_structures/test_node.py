import pytest

from src.data_structures.node import Node


def test_value_returns_the_value_of_the_node():
    one_node = Node(value=42)
    another_node = Node(value="value of the node")

    assert one_node.value == 42
    assert another_node.value == "value of the node"

def test_next_node_returns_the_subsequent_element():
    second_node = Node(value=42)
    first_node = Node(value=1, next_node=second_node)

    assert first_node.next_node == second_node

def test_next_node_returns_none_if_the_element_is_the_last():
    node = Node(value=42)

    assert node.next_node == None