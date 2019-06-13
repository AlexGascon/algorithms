def printable(element):
    if type(element) == str:
        return f"'{element}'"
    else:
        return str(element) 