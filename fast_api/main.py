from fastapi import FastAPI
import models.person as person

app = FastAPI()


@app.get("/async")
async def async_person():
    return person.Person


@app.get("/sync-person/")
def sync_person():
    return person.Person
