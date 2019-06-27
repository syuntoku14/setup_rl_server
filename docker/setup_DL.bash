# install python packages
conda config --add channels conda-forge
conda install -y jupyter pytorch torchvision -c pytorch
conda install -y pyvirtualdisplay
yes | pip3 install torchvision
yes | pip3 install gym "gym[atari]"

# Configure jupyter notebook server
jupyter notebook --generate-config
echo "c = get_config()" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 5000" >> ~/.jupyter/jupyter_notebook_config.py

# set jupyter vim extension
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable vim_binding/vim_binding
sed -i "/.*Ctrl-C.*:/d" ~/.local/share/jupyter/nbextensions/vim_binding/vim_binding.js
sed -i "/.*'Shift-Esc'.*:/a\      \'Ctrl-C\': CodeMirror.prototype.leaveInsertMode," ~/.local/share/jupyter/nbextensions/vim_binding/vim_binding.js