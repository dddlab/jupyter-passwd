# from jupyter-notebook documentation
# https://jupyter-notebook.readthedocs.io/en/stable/public_server.html#preparing-a-hashed-password

from notebook.auth import passwd
print('See documentation about securing your Jupyter notebook server')
print('https://jupyter-notebook.readthedocs.io/en/stable/public_server.html#preparing-a-hashed-password')
print('Enter a password to hash:')
print(passwd())
