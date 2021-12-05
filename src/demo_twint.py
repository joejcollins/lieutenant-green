""" Demonstration of twint in action. """
import twint


def twint_config():
    """ Return a config for to save 40 status posts as json. """
    twint_config = twint.Config()
    twint_config.Username = "politietsorost"
    twint_config.Limit = 40
    twint_config.Count = True
    twint_config.Store_json = True
    twint_config.Output = "data"
    return twint_config


def main():
    """ Download the tweets. """
    config = twint_config()
    twint.run.Search(config)


if __name__ == "__main__":
    main()
