# FROM jupyter/tensorflow-notebook:95ccda3619d0
FROM tensorflow/tensorflow:2.4.0rc2-gpu-jupyter


RUN pip install --use-feature=2020-resolver elasticsearch-dsl elasticsearch tensorflow-probability transformers[sentencepiece] pandas tensorflow_hub nltk emoji gensim umap-learn pydot sparqlwrapper beautifulsoup4 scrapy panel param holoviews datashader spacy node2vec GPyOpt mmh3 plotly
#The following two packages mess with tf-gpu:
# RUN pip install --use-feature=2020-resolver --user -q tf-models-official==2.3.0  tensorflow_text 
# RUN pip uninstall -y tensorflow==2.4.0
# RUN conda install faiss-gpu cudatoolkit=10.0 -c pytorch # For CUDA10
# RUN export export PATH=$PATH:/root/.local/bin
# RUN apt-get install -y --no-install-recommends graphviz