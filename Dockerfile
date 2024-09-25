# Use the official Python image.
FROM python:3.10-slim

# Set the working directory in the container.
WORKDIR /app

# Copy the requirements file to the container.
COPY requirements.txt .
COPY constraints.txt .

# Install the Python dependencies.
RUN pip install --upgrade pip && \
    pip install -r requirements.txt --constraint constraints.txt

# Copy the rest of the application code to the container.
COPY . .

# Set environment variables to make Python behave in a more production-friendly way.
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Expose port 8000 to the outside world.
EXPOSE 8000

# Ensure the entrypoint script is executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]

# Default command
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
