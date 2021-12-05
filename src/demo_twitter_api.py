""" Demonstration of the Twitter API in action. """
import requests
from dotenv import dotenv_values

secrets = dotenv_values(".env")
bearer_token = secrets['BEARER_TOKEN']
base_url = 'https://api.twitter.com/2/users/'

headers = {
    'Authorization': f"Bearer {bearer_token}"
}


def get_tweets(user_id, page_token=None):
    """ Return the tweets. """
    fields = "tweet.fields=created_at,entities,geo,referenced_tweets,source,text"
    url = f"{base_url}{user_id}/tweets?&{fields}"
    


def get_user_id(twitter_handle):
    """ Return the user id for a twitter handle. """
    url = f"{base_url}by/username/{twitter_handle}" 
    response = requests.request("GET", url, headers=headers)
    if response.status_code != 200:
        raise Exception(response.status_code, response.text)
    return response.json()


def main():
    """ Download the tweets. """
    user_id = get_user_id('politietsorost')


if __name__ == "__main__":
    main()
