# Pecunia API

## Overview

Pecunia API is a Ruby on Rails application designed to handle financial transactions and user authentication. It serves as the backend for a financial application, providing a secure and efficient way to manage transactions and user data.

## Features

- **User Authentication**: Secure user authentication using JWT (JSON Web Tokens).
- **Financial Transactions Management**: Create, read, update, and delete financial transactions.
- **Real-time Communication**: Supports real-time communication through Action Cable channels. (TODO)
- **Background Processing**: Utilizes Active Job for background processing tasks. (TODO)
- **Email Notifications**: Sends emails for various events using Action Mailer. (TODO)
- **Testing**: Comprehensive testing setup with RSpec, FactoryBot, and Faker.
- **Documentation**: API documentation generated with Rswag.
- **Code Quality**: Ensures high code quality with RuboCop and RubyCritic.
- **CORS**: Handles Cross-Origin Resource Sharing with Rack CORS.

## Getting Started

### Prerequisites

Before you begin, make sure you have the following installed on your system:

- [PostgreSQL](https://www.postgresql.org/)
- [Rails 7.1.3](https://rubyonrails.org/)
- [Ruby 3.3.0](https://www.ruby-lang.org/)

### Installation

1. Clone the repository:

  ```bash
  git clone https://github.com/Guistoff081/pecunia-api.git
  ```

2. Navigate to the project directory:
```bash
cd pecunia-api
```

3. Install dependencies:

```bash
bundle install
```

4. Set up the database:
```bash
rails db:prepare
```
5. Config Environment Variables:
```bash
cp .env.example .env
```
6. Start the Rails server:
```bash
rails s
```

7. Testing/Swagger Docs

- To access Swagger Docs navigate to `http://localhost:3000/api/v1/docs`
- To run the spec tests run `rspec`

## Usage

Once the server is running, you can access the API endpoints at `http://localhost:3000/api/v1/`.

### Authentication

To authenticate, send a POST request to `/api/v1/auth/login` with the user's credentials. The response will include a JWT token.

### Transactions

To create a new transaction, send a POST request to `/api/v1/transactions` with the transaction details.

## Contact

Elisson Guímel - elissong.silva2505@gmail.com

Project Link: [https://github.com/Guistoff081/pecunia-api](https://github.com/Guistoff081/pecunia-api)
