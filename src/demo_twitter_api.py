""" Demonstration of the Twitter API in action. """
import requests
import json
from dotenv import dotenv_values

secrets = dotenv_values(".env")
bearer_token = secrets['BEARER_TOKEN']
base_url = 'https://api.twitter.com/2/users/'

headers = {
    'Authorization': f"Bearer {bearer_token}"
}


def get_response(url):
    """ Make a call to the API. """
    response = requests.request("GET", url, headers=headers)
    if response.status_code != 200:
        raise Exception(response.status_code, response.text)
    return response.json()


def get_tweets(user_id, page_token=None):
    """ Return the tweets. """
    fields = "tweet.fields=created_at,entities,geo,referenced_tweets,source,text"
    url = f"{base_url}{user_id}/tweets?{fields}"
    if page_token:
        url = f"{url}&pagination_token={page_token}"
    page_of_tweets = get_response(url)
    tweets = page_of_tweets.get('data')
    next_token = page_of_tweets.get('meta').get('next_token')
    return tweets, next_token


def get_user_id(twitter_handle):
    """ Return the user id for a twitter handle. """
    url = f"{base_url}by/username/{twitter_handle}"
    user_data = get_response(url)
    user_id = user_data.get('data').get('id')
    return user_id


def main():
    """ Download and save the tweets. """
    user_id = get_user_id('politietsorost')
    all_tweets = []
    next_token = None  # the first time round
    for x in range(4):  # gets you 40
        tweets, next_token = get_tweets(user_id, next_token)
        all_tweets.extend(tweets)
    with open('data/more_tweets.json', 'w', encoding='utf-8') as tweet_file:
        json.dump(all_tweets, tweet_file, indent=4, ensure_ascii=False)


if __name__ == "__main__":
    main()
