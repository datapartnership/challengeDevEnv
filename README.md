# Geo Prototyping
This repo contains examples, tests and notebooks to test out how geo can work in Elucd;

## !!! Never For Production !!!

## What's included
* JupyterLab environment 
* Postgres database
* PG Admin

## Get Started
### Bring up just jupyter
`docker-compose up jupyter`

### Bring up the whole thing -> you need this to use the database:
`docker-compose up`

### Getting in:
* Jupyter will be at `http://127.0.0.1:8888/lab`
* Postgres will be accessible on the host machine at `http://127.0.0.1:5432`
* PGAdmin will be accessible on the host machine at `http://127.0.0.1:5433`
* The data will persist in PG by being stored to disk on the host machine in `data/pgdata`
* To get into PgAdmin, the credentials are `geodocker@isawesome.com/geodocker_pga_pass`
* Please see example in notebooks/db.ipynb for connecting to PG in python. 


### How it all fits together
* Use jupyter to prototype your code
* Use streamlit if needed (just for fun)
* Use PgAdmin to interactively query your database and monitor performance






## Notebooks
* Scratch: Really messy, do whatever notebook
* Proto: A less messy notebook that's easier to look at
