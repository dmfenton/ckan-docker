FROM python:2.7-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    postgresql-client \
    libpq-dev \
    git-core \
		build-essential

RUN pip install virtualenv virtualenvwrapper requests

RUN mkdir -p /usr/lib/ckan/default

RUN /bin/bash -c "source /usr/local/bin/virtualenvwrapper.sh"

RUN virtualenv --no-site-packages /usr/lib/ckan/default

RUN . /usr/lib/ckan/default/bin/activate

RUN pip install -e 'git+https://github.com/ckan/ckan.git@ckan-2.5.2#egg=ckan'

RUN pip install -r /src/ckan/requirements.txt

RUN pip install -e git+https://github.com/ckan/ckanext-harvest.git#egg=ckanext-harvest

RUN pip install -r /src/ckanext-harvest/pip-requirements.txt

RUN pip install -e git+https://github.com/ckan/ckanext-dcat.git#egg=ckanext-dcat

RUN pip install -r /src/ckanext-dcat/requirements.txt

RUN pip install ckanext-geoview

RUN mkdir -p /etc/ckan/default

COPY ./default.ini /etc/ckan/default

RUN ln -s /src/ckan/who.ini /etc/ckan/default/who.ini

COPY ./docker-entrypoint.sh /
