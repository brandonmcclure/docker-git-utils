[![Docker Stars](https://img.shields.io/docker/stars/bmcclure89/docker-bfg.svg?style=flat-square)](https://hub.docker.com/r/bmcclure89/docker-bfg/) [![Docker Pulls](https://img.shields.io/docker/pulls/bmcclure89/docker-bfg.svg?style=flat-square)](https://hub.docker.com/r/bmcclure89/docker-bfg/) [![Build Status](https://dev.azure.com/brandonmcclure89/docker-bfg/_apis/build/status/brandonmcclure.docker-bfg?branchName=main)](https://dev.azure.com/brandonmcclure89/docker-bfg/_build/latest?definitionId=13&branchName=main)

# docker-git utils
Sometimes I find good shell scripts for doing stuff with git, and I don't want to use WSL to get them to work. 

## Usage
### Building Container

```
make build
```
### Manually Using the Container

#### Get large commits/files
```
docker run --rm -v ${PWD}:/src -w /src bmcclure89/docker-git-utils:latest /app/Get-BigCommits.sh
```


#### Remove local merged branches, and prune
```
docker run --rm -v ${PWD}:/src -w /src bmcclure89/docker-git-utils:latest /app/Remove-MergedBranches.sh
```

### Find all branches that have a change to a given file
```
docker run --rm -v ${PWD}:/src bmcclure89/docker-git-utils -c '/app/Find-AllBranchesWithChange.sh Makefile'
```