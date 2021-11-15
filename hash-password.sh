#!/bin/bash

DEFAULT_PASSWORD=${DEFAULT_PASSWORD:-dddlab}
IMAGE=${IMAGE:-ghcr.io/dddlab/jupyter-passwd}
TAG=${TAG:-latest}
IMAGE_TAG=${IMAGE_TAG:-${IMAGE}:${TAG}}

function password_input {

    N_TRIES=1

    while [[ $N_TRIES -le 3 ]]
    do

        # turn off echo for password input
        stty -echo

        printf "Enter a password: " >&2
        read PASSWORD

        printf "\nConfirm password: " >&2
        read CONFPASS

        stty echo

        if [ "$PASSWORD" = "$CONFPASS" ]
        then
            printf "\n" >&2
            return
        else
            printf "\nEntered passwords are not equal\n"
            ((N_TRIES++))
        fi
    done

    PASSWORD="$DEFAULT_PASSWORD"    # use default password
    echo "Entered passwords are not equal"
    echo "Using default password, '$DEFAULT_PASSWORD'"

}

if [[ -z ${PASSWORD} ]];
then
    password_input
else 
    echo "Using PASSWORD variable: '$PASSWORD'"
    echo "Container image: ${IMAGE_TAG}"
fi

HASHED=$(\
    docker run --rm ${IMAGE_TAG} \
    python -c \
    "from notebook.auth import passwd; \
    print(passwd('$PASSWORD', 'sha1'))")
echo $HASHED
