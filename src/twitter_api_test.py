""" Tests for src/twitter_api.py """
import twitter_api


def test_method_is_present():
    """ Confirm that the methods are present """
    assert "get_user_id" in dir(twitter_api)
    assert "get_tweets" in dir(twitter_api)
