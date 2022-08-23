
from datetime import datetime
from pydantic import BaseModel


class Person(BaseModel):
    time: datetime = datetime.now()
    name: str = "Bart Simpson"
    age: int = 12
