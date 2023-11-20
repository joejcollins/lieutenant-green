"""Confirm that module_1 works."""
from package_b import module_1

def test_say_it():
    """Confirm that say it says hello."""
    # Act
    message = module_1.say_it()
    # Assert
    assert "hi" in message.lower()
