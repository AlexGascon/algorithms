from dataclasses import dataclass
from typing import Any

@dataclass
class Node:
    value: Any
    next_node: "__class__" = None