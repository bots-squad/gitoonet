# gitoonet

stay tuned :panda_face: - v1.1.0 - :construction:

## previous versions:

- https://github.com/bots-squad/gitoonet/releases/tag/v1.0.0

## What? Why?

- this is an educative tool
- I need a simple tool to train myself with git, feature flow, ... and simulate "working with team".
- I use https://github.com/substack/git-http-backend wit ExpressJS

## How to

### 1- launch the "git" server

> update settings in `go.js` (or manually set variables and run `git-server.js`)
> variables:
> - GIT_HTTP_PORT
> - GIT_SHARED_REPOSITORIES_LOCATION: the sub directory to store git shared repositories (default is `repos`)

```
./go.js
```

### 2- create a shared repository

> planned with the next version: you'll be able to do this from the browser

- go to the `GIT_SHARED_REPOSITORIES_LOCATION` sub directory (eg: `cd repos`)
- type (eg) `./init-bare-repo acme yo`, it will create a shared repository `yo.git` for the owner/organization `acme`:
```
├── acme
│   └── yo.git
│       ├── HEAD
│       ├── branches
│       ├── config
│       ├── description
│       ├── hooks
│       │   ├── applypatch-msg.sample
│       │   ├── commit-msg.sample
│       │   ├── post-update.sample
│       │   ├── pre-applypatch.sample
│       │   ├── pre-commit.sample
│       │   ├── pre-push.sample
│       │   ├── pre-rebase.sample
│       │   ├── pre-receive.sample
│       │   ├── prepare-commit-msg.sample
│       │   └── update.sample
│       ├── info
│       │   └── exclude
│       ├── objects
│       │   ├── info
│       │   └── pack
│       └── refs
│           ├── heads
│           └── tags
```

### 3- use it

#### You are @babs

- initialize a repository named `yo` (of the `acme` organization) and set the `config` file of the repository as if you are **babs**:
```
mkdir yo
cd yo
git init
echo "[user]" >> .git/config
echo "  name = babs" >> .git/config
echo "  email = babs@typunsafe.org" >> .git/config
```
- create a file with content:
```
cd yo
echo "# Yo project" > README.md
git add .
git commit -m "add README.md"
git push http://localhost:5555/gitsrv/acme/yo.git master
```
- go to `/repos/acme/yo.git`
- type `git log`, and you'll get something like that:
```
commit 61de85e64436c8ca5efa3ad6f7b28c27a5e4d4de
Author: babs <babs@typunsafe.org>
Date:   Thu Dec 15 07:25:13 2016 +0100
```

#### You are @buster

Now, you can play as an other user: **buster**:

- clone the repository named `yo` (of the `acme` organization) and set the `config` file of the repository as if you are **buster**:
```
git clone http://localhost:5555/gitsrv/acme/yo.git
cd yo
echo "[user]" >> .git/config
echo "  name = buster" >> .git/config
echo "  email = buster@typunsafe.org" >> .git/config
```
- add a new file and push to the server:
```
cd yo
echo "some documentation" > DOC.md
git add .
git commit -m "add DOC.md"
git push http://localhost:5555/gitsrv/acme/yo.git master
```
- go to `/repos/acme/yo.git`
- type `git log`, and you'll get something like that:
```
commit 9f9b0b0fc0ef37ed9b8b89f9367aadf23c6ba525
Author: buster <buster@typunsafe.org>
Date:   Thu Dec 15 07:31:28 2016 +0100

    add DOC.md

commit 61de85e64436c8ca5efa3ad6f7b28c27a5e4d4de
Author: babs <babs@typunsafe.org>
Date:   Thu Dec 15 07:25:13 2016 +0100
```

> more to come... :construction:
