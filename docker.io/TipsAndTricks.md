## Tips and Tricks

Remove all stopped containsers
> docker rm $(docker ps -a -q)

Remove all untagged images (you can force with -f)
> docker rmi $(docker images | grep '^<none>' | awk '{print $3}'

