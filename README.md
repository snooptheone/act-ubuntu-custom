# act-ubuntu-custom

A small [nektos/act](https://github.com/nektos/act) runner image: [`catthehacker/ubuntu:act-latest`](https://github.com/catthehacker/docker_images) plus the tools the real GitHub runner has and that image lacks (today: `gh`, `default-jdk-headless`, `rsync`, `tea`). Add more installs to the `Dockerfile` as needed.

Rebuilt and pushed to `ghcr.io/snooptheone/act-ubuntu-custom:latest` on every change to the `Dockerfile` and once a week, so it follows its base image. Each build is also tagged with its build date (`YYYYMMDD`), so you can pin an older one. A second build on the same day overwrites that day's tag. The image is smoke-tested before it is pushed. Pull requests and runs on other branches build and test the image but do not publish it; only `main` publishes.

GitHub turns off scheduled workflows after 60 days without repo activity. Merge the monthly Dependabot PRs, or run the `publish` workflow by hand now and then, so the weekly rebuild keeps going. The newest 10 image versions are kept; older ones are deleted.

## Use

```bash
act --pull=false -P ubuntu-latest=ghcr.io/snooptheone/act-ubuntu-custom:latest ...
```

Run `docker pull ghcr.io/snooptheone/act-ubuntu-custom:latest` first, because `--pull=false` stops act from fetching it. Or put the `-P` line in `~/.config/act/actrc`.

## License

[BSD Zero Clause License](LICENSE). The base image and the tools installed in it keep their own licenses.
