from datetime import datetime

from pydantic import BaseModel


class Hat(BaseModel):
    color: str = "red"
    size: int = 75
    price: float = 10.0


class Person(BaseModel):
    time: datetime = None
    name: str = "El Barto"
    age: int = 12

    def __init__(self) -> None:
        # Initialize the time otherwise it always returns the time the web app
        # started.
        super().__init__()
        self.time = datetime.now()

    hat: Hat = Hat()


class PersonPlain():
    time: datetime = datetime.now()
    name: str = "Bart Simpson"
    age: int = 12

    def __init__(self):
        """Initialize the parameters."""
        self.time = datetime.now()
        self.name = "Bart Simpson"
        self.age = 12
