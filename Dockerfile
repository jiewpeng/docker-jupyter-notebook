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
	# set up jupyter notebook extensions
	&& jupyter nbextension enable latex_envs/latex_envs --user \
	&& jupyter nbextension enable codefolding/main --user \
	&& jupyter nbextension enable comment-uncomment/main --user \
	&& jupyter nbextension enable execute_time/ExecuteTime --user \
	&& jupyter nbextension enable hide_input/main --user \
	&& jupyter nbextension enable toggle_all_line_numbers/main --user \
	&& jupyter nbextension enable code_prettify/2to3 --user \
	&& jupyter nbextension enable codefolding/edit --user \
	&& jupyter nbextension enable hide_input_all/main --user \
	&& jupyter nbextension enable init_cell/main --user \
	&& jupyter nbextension enable limit_output/main --user \
	&& jupyter nbextension enable python-markdown/main --user \
	&& jupyter nbextension enable tree-filter/index --user \
	&& jupyter nbextension enable move_selected_cells/main --user \
	&& jupyter nbextension enable snippets/main --user \
	&& jupyter nbextension enable toc2/main --user \
	&& jupyter nbextension enable equation-numbering/main --user \
	&& jupyter nbextension enable ruler/main --user \
	&& jupyter nbextension enable snippets_menu/main --user \
	# theme
	&& conda install --yes 'jupyterthemes=0.18.*' \
	&& jt -t onedork -fs 11 -altp -tfs 12 -nfs 115 -ofs 105 -cellw 88% -T -N \
	# snippets
	&& wget -O ./.local/share/jupyter/nbextensions/snippets/snippets.json \
		https://raw.githubusercontent.com/jiewpeng/docker-jupyter-notebook/master/snippets.json