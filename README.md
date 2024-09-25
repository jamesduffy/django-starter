# Django Starter
This repository serves as a starter template for any Django projects. It includes best practices and boilerplate code to kickstart development.

## Features
- [ ] Django with PostgreSQL setup
- [ ] Pre-configured settings for local development and production
- [ ] Docker and Docker Compose setup
- [ ] Integrated with Celery for background tasks
- [ ] Pre-installed linting and formatting tools
- [ ] GitHub Actions for CI/CD pipeline
- [ ] .env support for environment variables

## Getting Started

### Prerequisites
- Python 3.10+
- Docker
- PostgreSQL

### Installation

Clone the repository:
```bash
git clone https://github.com/yourusername/django-starter.git
cd django-starter
```

Create a virtual environment and install dependencies:
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Set up your environment variables by creating a .env file:
```bash
cp .env.example .env
```

Run the database migrations:
```bash
python manage.py migrate
```

Start the development server:
```bash
python manage.py runserver
```

## Running with Docker


Build and run the containers:
```bash
docker-compose up --build
```

Access the project at http://localhost:8000.

## Contributing
Feel free to open an issue or submit a pull request to contribute to this starter template.

## License
This project is licensed under the MIT License.