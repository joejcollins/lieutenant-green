# Downloading Tweets

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/joejcollins/lieutenant-green)

## Factors

Twitter licence


## Options

Python is the obvious choice for this kind for work.

### requests and beautifulsoup4

The obvious strate

Brittle strategy

Someone else must have done the work.

And indeed that have

### twitter-scraper

Supposed to do exactly what is says on the tin.

https://pypi.org/project/twitter-scraper/

Fails with `json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)` 

Tests fail with the same error.

Last substantive update was Jul 2020.

### Twint



pip install --user --upgrade git+https://github.com/twintproject/twint.git@origin/master#egg=twint


twint -u joejcollins

### Twitter API v2

Agree to terms and conditions

curl -X GET -H "Authorization: Bearer <BEARER TOKEN>" "https://api.twitter.com/2/tweets/440322224407314432"


## Recommendation

Despite the challenges of negoiating with Twitter best to work with them.

