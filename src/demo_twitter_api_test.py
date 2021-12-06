""" Tests for src/demo_twitter_api.py """
import demo_twitter_api


def test_method_is_present():
    """ Confirm that the methods are present. """
    assert "get_user_id" in dir(demo_twitter_api)
    assert "get_tweets" in dir(demo_twitter_api)


def test_get_user_id():
    """ Confirm that the user id is returned. """
    user_id = demo_twitter_api.get_user_id("joejcollins")
    assert user_id == '249106004'
    user_id = demo_twitter_api.get_user_id("SmartDevsUg")
    assert user_id == '1600244690'


def test_get_tweets():
    """ Confirm that 10 tweets come back. """
    tweets, token = demo_twitter_api.get_tweets('1600244690')
    assert len(tweets) == 10
    assert isinstance(token, str)
