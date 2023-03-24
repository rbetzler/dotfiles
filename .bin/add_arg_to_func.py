#!/usr/bin/env python3
"""Add an argument to a python function"""

import ast
import sys


def main(file_path, function, arg_to_add):
    contents = open(file_path).read()
    lines = open(file_path).readlines()

    module = ast.parse(contents)
    nodes = [n for node in module.body for n in ast.walk(node)]

    for node in nodes:
        if isinstance(node, ast.Call):
            if hasattr(node.func, "id") and node.func.id == function:
                lines.insert(node.end_lineno - 1, arg_to_add)
            if hasattr(node.func, "attr") and node.func.attr == function:
                lines.insert(node.end_lineno - 1, arg_to_add)

    with open(file_path, "w") as f:
        f.writelines(lines)


if __name__ == "__main__":
    main(
        file_path=sys.argv[1],
        function=sys.argv[2],
        arg_to_add=sys.argv[3],
    )
