# Use the official Python image from the Docker Hub
FROM python:3.11-slim-bullseye

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY src /app/

# Copy the entrypoint script into the container
COPY entrypoint.sh /app/

# Give execution permissions to the entrypoint script
RUN chmod +x /app/entrypoint.sh

# Expose the port the app runs on
EXPOSE 8000

# Set the entrypoint to the script
ENTRYPOINT ["/app/entrypoint.sh"]

# Run the Gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "cfehome.wsgi:application"]