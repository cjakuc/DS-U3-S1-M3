FROM debian
### So logging/io works reliably w/Docker
ENV PYTHONUNBUFFERED=1

### UTF Python issue for Click package (pipenv dependency)
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

### Need to explicitly set this so `pipenv shell` works
ENV SHELL=/bin/bash

### Basic Python dev dependencies
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install python3-pip curl -y && \
  pip3 install pipenv && \
  pip3 install -i https://test.pypi.org/simple/ cjakuc-lambdata-cjakuc==1.5
  # Makes a python shell and imports the package from test pypi and will print success
  # python3 -c "import my_lambdata.my_mod; print('success!')"
