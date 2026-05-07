# Rails Modular Monolith With interactor Pattern Project

This README provides the necessary steps to get the application up and running.

## Prerequisites

- Docker
- Docker Compose

## How to run the project locally

1. **Clone the repository** (if you haven't already):
   ```bash
   git clone <repository-url>
   cd rails-dd
   ```

2. **Build and start the services:**
   We use Docker Compose to manage the application and its dependencies (like PostgreSQL).
   Run the following command to build the image and start the containers:
   ```bash
   docker-compose up --build
   ```

   This command will automatically:
   - Build the web container
   - Start the PostgreSQL database
   - Prepare the database (`bundle exec rails db:prepare`)
   - Start the Rails server on port 3000

3. **Access the application:**
   Once the containers are running, open your web browser and navigate to:
   [http://localhost:3000](http://localhost:3000)

## Stopping the application

To stop the running containers, press `Ctrl + C` in the terminal where Docker Compose is running.
Alternatively, you can run the following command in another terminal window:
```bash
docker-compose down
```

## Running the test suite

To run the tests inside the Docker container, use the following command:
```bash
docker-compose exec web bundle exec rails test
```
