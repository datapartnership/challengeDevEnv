# Start from a core stack version
FROM jupyter/scipy-notebook:6d42503c684f

USER root


RUN apt-get update \
    && apt-get install software-properties-common -y \
    && apt-get install gdal-bin -y && apt-get install libgdal-dev -y \
    && apt-get install -y libproj-dev proj-data proj-bin libgeos-dev libspatialindex-dev  \
    && apt-get install -y osmctools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    

USER $NB_ID

WORKDIR /home/jovyan

RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal && export C_INCLUDE_PATH=/usr/include/gdal
RUN pip install GDAL==$(gdal-config --version | awk -F'[.]' '{print $1"."$2}') && \
    pip install pyrasterframes==0.8.5

COPY requirements.txt ./requirements.txt

RUN pip install -r requirements.txt



#Install the Dask dashboard
# RUN pip install dask_labextension ; \
#    jupyter labextension install -y --clean \
#    dask-labextension

#RUN pip install --no-cache-dir notebook==5.*



# Plotly
#RUN jupyter labextension install jupyterlab-plotly

# Doc
#RUN jupyter labextension install @jupyterlab/toc

#GEOJSON
#RUN jupyter labextension install @jupyterlab/geojson-extension

# KEPLER
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager keplergl-jupyter

# Vim
RUN jupyter labextension install @axlair/jupyterlab_vim

# Solarized
RUN jupyter labextension install jupyterlab-theme-solarized-dark


# Streamlit
RUN mkdir -p /root/.streamlit
RUN bash -c 'echo -e "\
[general]\n\
email = \"\"\n\
" > /root/.streamlit/credentials.toml'

RUN bash -c 'echo -e "\
[server]\n\
enableCORS = false\n\
" > /root/.streamlit/config.toml'



# Streamlit Port
EXPOSE 8501

# Dask Scheduler & Bokeh ports
#EXPOSE 8787
#EXPOSE 8786

#ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
