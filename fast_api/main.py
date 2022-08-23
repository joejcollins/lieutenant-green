from fastapi import FastAPI

app = FastAPI()


@app.get("/async")
async def async_person():
    return {"message": "Hello World"}


@app.get("/sync-person/")
def sync_person():
    return {"message": "Hello World"}
