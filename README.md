## !!! Never For Production !!!
This is meant to be a prototyping and development environment, and is not optimized or secured for production.  Please treat it as such. 

## Credit where credit is due
This is heavily based on the [DataDriven Data Science Template](https://github.com/drivendata/cookiecutter-data-science) with a few modifications.  We wanted to add a few challenge specific packages and libraries, enable you to run Dask and Coiled, and put a bit of additional, healthy constraints to improve collaboration and reproducibility. 

## What's included
* JupyterLab environment with GDAL, Rasterio and other geospatial libraries that support it pre-installed.  
* Postgres database
* Streamlit for interactive development
* PG Admin

## Quick Start
### Install Docker
* For Mac: https://store.docker.com/editions/community/docker-ce-desktop-mac
* For Windows: https://store.docker.com/editions/community/docker-ce-desktop-windows
* For Linux: Go to this page and choose the appropriate install for your Linux distro: https://www.docker.com/community-edition

### Install Docker-Compose
[Mac / Win / Linux](https://docs.docker.com/compose/install/)

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

### Repo Structure

```
├── README.md          <- The top-level README for developers using this project.
├── Dockerfile         <- Docker container configuration.
├── .env.example       <- Sample environment file to be copied to `.env`
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   └── processed      <- The final, canonical data sets for modeling.
│
├── docs               <- Various build / usage info about the project.
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│
│
└─src                <- Source code for use in this project.
  ├── __init__.py    <- Makes src a Python module
  └── streamlit/app.py     <- Sample streamlit app
```


## Adding Modules
`requirements.txt` is the file used to build the docker container.  If you add modules in `requirements.txt` they will not be available to your Docker environment until after a `docker-compose build`.

To circumvent this problem, put your modules into `requirements-extra.txt`;  This will let you add modules to your docker environment upon relaunch (`docker-compose up`).  Once you know you want to keep them, move them to `requirements.txt` and rebuild the containers.
