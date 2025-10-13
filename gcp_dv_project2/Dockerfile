FROM python:3.11-slim

# Prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1
# Ensure output appears instantly
ENV PYTHONUNBUFFERED=1

# Set workdir
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt /tmp/
RUN pip install --upgrade pip && pip install --no-cache-dir -r /tmp/requirements.txt

# Copy dbt project files
COPY . /app

# Install dbt packages (like datavault4dbt macros)
RUN dbt deps

# Set environment variable for profiles.yml
ENV DBT_PROFILES_DIR=/app

# Default command
ENTRYPOINT ["dbt", "run"]
