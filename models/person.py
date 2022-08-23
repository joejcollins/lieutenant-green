
from pydantic import BaseModel


class Person(BaseModel):
    name: str = "Bart Simpson"
    age: int = 12
