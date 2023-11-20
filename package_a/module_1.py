import sys

def say_it():
    """This function says hi and includes the python version in the message."""
    python_version = sys.version_info
    message = (
        f"Hello, from {__name__} in the package folder on "
        f"Python {python_version.major}.{python_version.minor}.{python_version.micro}"
    )
    print(message)
