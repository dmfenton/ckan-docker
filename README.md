# CKAN Docker

*CKAN and friends running in Docker with the DCAT harvesting extension*

## How to federate from an ArcGIS Open Data Site

1. run `docker-compose up`
2. open a command line on the ckan container `docker exec -it ckan /bin/bash`
3. create and admin `paster sysadmin add admin -c /etc/ckan/default/default.ini`
4. log in to ckan `localhost:5000/ckan-admin`
5. create a new organization
6. log in to the harvest control `localhost:5000/harvest`
7. add a new source: select dcat json, select frequency always
8. select admin
9. select run harvest job
