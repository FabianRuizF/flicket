FROM python:3.9-slim

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install MySQL driver
RUN pip install pymysql

RUN flask db upgrade

RUN apt-get update && apt-get install -y iputils-ping
CMD ["bash", "-c", "tail -f /dev/null"]
##CMD ["bash"]
#
#RUN python3 -m scripts.create_json

# Run the setup script
#RUN flask run-set-up

# Upgrade the database
#RUN flask db upgrade

# Make port 5000 available to the world outside this container
#EXPOSE 5000

# Run run.py when the container launches
#CMD ["flask", "run"]
