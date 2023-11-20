import sys
from unittest.mock import patch
from io import StringIO
import pytest

# Import the module under test
from package_b.src.package_b import module_1


def test_say_it():
    # Arrange
    # Act

    # Assert
    assert captured.out.strip() == expected_output
