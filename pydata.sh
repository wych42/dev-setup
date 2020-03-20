#!/usr/bin/env bash

# ~/pydata.sh

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

echo "------------------------------"
echo "Setting up pyenv."

brew install pyenv
brew install pyenv-virtualenv

pyenv install 3.8.0

export PYTHON_VERSION=3.8.0
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv virtualenv 3.8.0 v3
pyenv virtualenv 3.8.0 pydata

pyenv active pydata
# Install Python data modules
pip install --upgrade pip
pip install numpy
pip install scipy
pip install matplotlib
pip install pandas
pip install sympy
pip install nose
pip install unittest2
pip install seaborn
pip install scikit-learn
pip install "ipython[all]"
pip install bokeh
pip install Flask
pip install sqlalchemy
brew install mysql # provide mysql_config
pip install mysqlclient

pyenv install 2.7.17
pyenv virtualenv 2.7.17 v2
echo "------------------------------"
echo "Script completed."
