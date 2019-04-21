FROM gcr.io/kubeflow-images-public/tensorflow-1.13.1-notebook-cpu:v0.5.0

ENV IMAGE_UPDATE_DATE='20 APR 2019'

RUN pip install --upgrade pip \
	&& pip install --no-cache-dir -r \
		https://gist.githubusercontent.com/jiewpeng/dc03e3229dfd4843e03e2e01a72aa331/raw/0f95c69b763155ef8a4a1b6449b5dafcb976b9b9/requirements.txt \
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
	&& conda install --yes 'jupyterthemes' \
	&& jt -t onedork -fs 11 -altp -tfs 12 -nfs 115 -ofs 105 -cellw 88% -T -N \
	# in case image does not come with the start notebook scripts
	&& wget -O /usr/local/bin/start.sh https://raw.githubusercontent.com/kubeflow/kubeflow/master/components/tensorflow-notebook-image/start.sh \
	&& wget -O /usr/local/bin/start-singleuser.sh https://raw.githubusercontent.com/kubeflow/kubeflow/master/components/tensorflow-notebook-image/start-singleuser.sh \
	&& wget -O /usr/local/bin/start-notebook.sh https://raw.githubusercontent.com/kubeflow/kubeflow/master/components/tensorflow-notebook-image/start-notebook.sh

USER root
RUN chmod a+rx /usr/local/bin/*
USER jovyan

COPY snippets.json .local/share/jupyter/nbextensions/snippets/snippets.json
