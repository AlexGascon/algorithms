from dataclasses import dataclass

from src.data_structures.utils import printable

class Stack:
    def __init__(self):
        self.elements = []

    def push(self, element):
        self.elements.append(element)

    def pop(self):
        if self.is_empty(): return None

        return self.elements.pop()

    def peek(self):
        if self.is_empty(): return None

        return self.elements[-1]

    def is_empty(self):
        return self.size == 0

    @property
    def size(self):
        return len(self.elements)

    def __str__(self):
        string_elements = ', '.join(printable(elem) for elem in reversed(self.elements))

        return f"Stack({string_elements})"
