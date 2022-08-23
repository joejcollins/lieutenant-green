from datetime import datetime

from pydantic import BaseModel


class Person(BaseModel):
    time: datetime = datetime.now()
    name: str = "Bart Simpson"
    age: int = 12

    def __init__(self) -> None:
        super().__init__()
        self.time = datetime.now()


class PersonPlain():
    time: datetime = datetime.now()
    name: str = "Bart Simpson"
    age: int = 12

    def __init__(self):
        """Initialize the parameters."""
        self.time = datetime.now()
        self.name = "Bart Simpson"
        self.age = 12
