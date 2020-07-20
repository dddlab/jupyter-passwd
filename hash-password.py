# from jupyter-notebook documentation
# https://jupyter-notebook.readthedocs.io/en/stable/public_server.html#preparing-a-hashed-password

from notebook.auth import passwd
print('Enter a password to be hashed')
print('For details, refer to this documentation: https://jupyter-notebook.readthedocs.io/en/stable/public_server.html#preparing-a-hashed-password')
print(passwd())
