"""  """
import requests
import secrets
from dotenv import dotenv_values

url = "https://api.twitter.com/2/users/975666887173566464/tweets"
secrets = dotenv_values(".env")

headers = {
  'Authorization': f"Bearer {secrets['BEARER_TOKEN']}"
}

response = requests.request("GET", url, headers=headers)

print(response.text)
