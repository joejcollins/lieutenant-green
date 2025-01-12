# Notes

[Lieutenant Green](https://en.wikipedia.org/wiki/Lieutenant_Green)

## Local Container

Running a local container pass in the GCS key like this.

```json
		}
	},
	"runArgs": [
		"--env-file",
		".devcontainer/devcontainer.env"
	],
	"postCreateCommand": ". ./.devcontainer/post-create.sh  > ./.devcontainer/post-create-log.txt",
	"postStartCommand": ". ./.devcontainer/post-start.sh  > ./.devcontainer/post-start-log.txt"
}
```

Add something like this to `.devcontainer/devcontainer.env`.

```ini
LIEUTENANT_GREEN_GCS_READONLY_KEY={ }
```
