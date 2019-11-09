py manage.py makemigrations account --settings=backend.settings.dev
py manage.py makemigrations imgs --settings=backend.settings.dev
py manage.py makemigrations question --settings=backend.settings.dev
py manage.py makemigrations answer --settings=backend.settings.dev
py manage.py makemigrations column --settings=backend.settings.dev
py manage.py makemigrations article --settings=backend.settings.dev
py manage.py makemigrations favlists --settings=backend.settings.dev
py manage.py makemigrations report --settings=backend.settings.dev
py manage.py makemigrations comment --settings=backend.settings.dev
py manage.py makemigrations votes --settings=backend.settings.dev

py manage.py migrate --settings=backend.settings.dev