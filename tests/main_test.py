"""Tests of the main."""

from lieutenant_green import main

def test_main_message() -> None:
    """Confirm message returned."""
    the_message = main.main()
    assert "Hello" in the_message
    assert "world" in the_message

