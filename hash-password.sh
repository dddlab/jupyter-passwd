#!/bin/bash

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

    # default password
    PASSWORD='dddlab'
        echo "Entered passwords are not equal (using default password, '$PASSWORD')"
}

password_input

HASHED=$(\
    docker run --rm ghcr.io/dddlab/jupyter-passwd:main \
    python -c \
    "from notebook.auth import passwd; \
    print(passwd('$PASSWORD', 'sha1'))")
echo $HASHED
