#!/bin/bash
echo " -----> Running Django database migration"
python manage.py migrate
if (tty > /dev/null 2>&1); then
    echo " -----> Running Django super user creation"
    python manage.py createsuperuser
fi
