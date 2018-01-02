FROM jupyter/scipy-notebook:2c80cf3537ca

ENV IMAGE_UPDATE_DATE='2 JAN 2018'

RUN pip install --upgrade pip \
	&& pip install -I --no-cache-dir \
	# Google recommends installing tensorflow using pip and not conda
	'tensorflow==1.4.*' \
	&& conda install --yes \
	'seaborn=0.8.*' \
	'spacy=2.0.*' \
	'gensim=3.1.*' \
	'lxml=4.1.*' \
	'networkx=2.0' \
	'nltk=3.2.*' \
	'textacy=0.5.*' \
	'jupyter_contrib_nbextensions=0.3.*' \
	&& python -m spacy download en \
	&& jupyter contrib nbextension install --user \
	&& conda install --yes 'ipywidgets=7.0.*'
