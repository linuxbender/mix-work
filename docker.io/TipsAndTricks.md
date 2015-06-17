## Tips and Tricks

Remove all stopped containsers
```bash
docker rm $(docker ps -a -q)
```

Remove all untagged images (you can force with -f)
```bash
docker rmi $(docker images | grep '<none>' | awk '{print $3}')
```

