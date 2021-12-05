# Downloading Tweets

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/joejcollins/lieutenant-green)

## Factors

Longevity and robustness

Repetition

Twitter licence

## Options

### Requests and BeautifulSoup4

Classically scraping web pages can be done with Requests and BeautifulSoup4.  Requests is used to get the HTML and BeautifulSoup4 to parse the HTML.  Obviously this is a brittle strategy since it is dependent on the pages layout to work, so design changes can break the scraping.  There were a number of Open Source solutions available (e.g. https://github.com/bisguzar/twitter-scraper) which took this approach and currently no longer work, which is probably testimony to the brittleness of this approach.

More to the point, the Twitter web page has a infinite scroll which makes javascript calls to the https://api.twitter.com/graphql endpoint to draw down new tweets.  With enough effort one could probably determine how to mimic these calls.  Fortunately an Open Source solution is available which does exactly that.

### Twint

Twint (Twitter Intelligence Tool) makes use of the https://api.twitter.com/graphql endpoint to retrieve tweets and even includes facilities to store the tweets as json or in a SQLite database.  Never-the-less the strategy remains somewhat brittle.  At the time of writing version 2.1.20 on https://pypi.org/ but the version from https://github.com/twintproject/twint.git does.  A more formal and probably less brittle approach is to use the official Twitter API.

### Twitter API v2

In theory this should be the best way to download a set of tweets.


Agree to terms and conditions

curl -X GET -H "Authorization: Bearer <BEARER TOKEN>" "https://api.twitter.com/2/tweets/440322224407314432"


## Recommendation

Despite the challenges of negoiating with Twitter best to work with them.

