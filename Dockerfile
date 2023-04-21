FROM python:3.8

# Update package repositories
# Create working directory
WORKDIR /testing

# Create virtual environment
RUN python -m venv venv

# Activate virtual environment
CMD source venv/bin/activate

# Copy requirements file to app file
COPY requirement.txt /testing/requirement.txt

# Installing the required library
RUN pip install -r requirement.txt

# Copy all the necessary file and folder to app directory
COPY . /testing

# Copy all the necessary file and folder to app directory
CMD python manage.py migrate
# Run the project
CMD python manage.py runserver 0.0.0.0:8000