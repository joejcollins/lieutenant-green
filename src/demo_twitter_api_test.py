""" Tests for src/demo_twitter_api.py """
import demo_twitter_api


def test_method_is_present():
    """ Confirm that the methods are present """
    assert "get_user_id" in dir(demo_twitter_api)
    assert "get_tweets" in dir(demo_twitter_api)
