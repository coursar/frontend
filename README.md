To generate production build:

PowerShell:
```shell
docker run -v "${PWD}:/app" frontend-builder build
```

CMD:
```shell
docker run -v "%PWD%:/app" frontend-builder build
```

Bash:
```shell
docker run -v "$(pwd):/app" frontend-builder build
```
