# ntopng-docker

Docker for running [ntopng](https://github.com/ntop/ntopng)

## Build

```
docker build -t ntopng .
```

## Run

### After building from source

```
docker run --net=host -t -p 3000:3000 ntopng
```

### From docker hub...

```
docker run --net=host -t -p 3000:3000 junquera/ntopng
```

## Cloning the repos

Why have I specified the commits when cloning the repos?

```
git reset --hard a974988973c1ff4a999bbf583310e40c46d86e2a
```

In my opinion, a docker means stability, and these are the last commits for which I know the *Dockerfile* will work. Feel free to change, and if It works, feel also free to make a *pull request* :wink:
