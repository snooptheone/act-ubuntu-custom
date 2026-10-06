# act-ubuntu-custom

A small [nektos/act](https://github.com/nektos/act) runner image: [`catthehacker/ubuntu:act-latest`](https://github.com/catthehacker/docker_images) plus the tools the real GitHub runner has and that image lacks (today: `gh`). Add more installs to the `Dockerfile` as needed.

Rebuilt and pushed to `ghcr.io/snooptheone/act-ubuntu-custom:latest` on every change to the `Dockerfile` and once a week, so it follows its base image.

## Use

```bash
act --pull=false -P ubuntu-latest=ghcr.io/snooptheone/act-ubuntu-custom:latest ...
```

Run `docker pull ghcr.io/snooptheone/act-ubuntu-custom:latest` first, because `--pull=false` stops act from fetching it. Or put the `-P` line in `~/.config/act/actrc`.

## License

[BSD Zero Clause License](LICENSE). The base image and the tools installed in it keep their own licenses.
