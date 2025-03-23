# Use the official Python image as base
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the application files to the container
COPY app.py requirements.txt ./

# Install the required dependencies
RUN pip install -r requirements.txt

# Expose port 5000 for the web app
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
