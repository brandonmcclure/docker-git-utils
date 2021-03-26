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
Sometimes I loose my changes, they are on one of these branches but I don't know which one.... to find out, use the `Find-AllBranchesWithChange.sh` script and pass the path to the file as an argument
```
docker run --rm -v ${PWD}:/src bmcclure89/docker-git-utils -c '/app/Find-AllBranchesWithChange.sh Makefile'
```