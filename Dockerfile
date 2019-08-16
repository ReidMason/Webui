FROM python:3.7.3-stretch

RUN apt-get update
RUN apt-get install -y nginx supervisor

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install the dependencies
RUN pip install -r requirements.txt

# Create nginx user
RUN useradd --no-create-home nginx

# Remove defualt enables sites
RUN rm /etc/nginx/sites-enabled/default
RUN rm -r /root/.cache

COPY nginx.conf /etc/nginx/
# Copy in new enabled sites
COPY nginx-sites-available.conf /etc/nginx/conf.d/
COPY webui.ini /etc/uwsgi/
COPY supervisord.conf /etc/

CMD ["/usr/bin/supervisord"]