# docker-ntopng

## Build

```
docker build -t ntopng .
```

## Run

```
docker run --net=host -t -p 3000:3000 ntopng
```

## Cloning the repos

Why have I chosen the commits on cloning the repos?

```
git reset --hard a974988973c1ff4a999bbf583310e40c46d86e2a
```

These are the last commits I know the *Dockerfile* works. Feel free to change, and if It works, feel also free to PR ;)
