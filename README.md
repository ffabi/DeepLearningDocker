# DeepLearningDocker
Ultimate Docker image with some commonly used features and packages mostly for Deep Learning

## Getting started
run

`./create_docker.sh`

This will build the image and start the container according to `Dockerfile` and `docker-compose.yml`

The folder
`copy_files`
will be copied in 
`/root/copy_files`
in the container

### Conda
For an example conda environment, see
`copy_files/environments/tensorflow_2.yml`

### tmux
The file
`tmux-session`
is used to create the tmux sessions upon startup.
Originated from https://github.com/mislav/dotfiles/blob/master/bin/tmux-session

### Future works
- Avoid using root user, copy user id to container

### etc
