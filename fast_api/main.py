from fastapi import FastAPI
import models.person as person

app = FastAPI(
    swagger_ui_parameters={
        "docExpansion": "none",
        "syntaxHighlight.theme": "nord",
        "tryItOutEnabled": True,
    },
)


@app.get("/async")
async def async_person():
    bart = person.Person()
    return bart


@app.get("/sync-person/")
def sync_person():
    bart = person.PersonPlain()
    bart.age = 11
    return bart
