#!/bin/sh
set -e

IMAGE_LIST_FILE=image-list

# --- helper functions for logs ---
info()
{
    echo '[INFO] ' "$@"
}
warn()
{
    echo '[WARN] ' "$@" >&2
}
fatal()
{
    echo '[ERROR] ' "$@" >&2
    exit 1
}

# --- fatal if no docker ---
verify_docker() {
    if [ -x /usr/local/bin/docker ]; then
        HAS_DOCKER=true
        return
    fi
    fatal 'Can not find docker'
}

read_user_name() {
    read -p "Please input your username: " USERNAME
}

get_tag(){
    printf '%s' ${line#*:}
}

get_image_name(){
    str=${line%%:*}
    printf '%s' ${str##*/}
}

change_image_name() {
    docker_name=$(get_image_name ${line})
    docker_tag=$(get_tag ${line})
    printf '%s' $USERNAME/$docker_name:$docker_tag
}

get_image_id() {
    printf '%' $(docker images|grep ${line} | awk '{printf $3}')
}

read_config() {
	cat "${IMAGE_LIST_FILE}" | while read line
    do
        docker pull ${line}
        # echo ${line}
        # echo $(get_image_id ${line})
        docker tag ${line} $(change_image_name ${line})
        docker push $(change_image_name ${line})
        # echo $(change_image_name ${line})
    done
}

# --- run the install process --
{
    verify_docker
    read_user_name
    docker login
    read_config
}