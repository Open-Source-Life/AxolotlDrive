# AxolotlDrive

An open-source, self-hosted Google Drive alternative built with Go.

> **NOTE:** AxolotlDrive is a complete rewrite of RustyDrive in Go. We realized that while Rust provides excellent performance, Go offers a more accessible entry point for contributors and is perfectly suited for self-hosted applications.

## Description

AxolotlDrive is a lightweight, privacy-focused file storage and synchronization solution designed to give you complete control over your data. Host it yourself, own your files, and enjoy a seamless cloud storage experience without relying on third-party services.

## Features

- 📁 File upload and download with chunked streaming
- 🗂️ Full folder management (create, copy, move, delete)
- 🔍 Advanced search with pagination
- 🔄 Real-time file synchronization via WebSocket
- 🔒 Self-hosted and privacy-first
- ⚡ Built with Go for simplicity and performance
- 🌐 RESTful API with clean architecture
- 👥 Multi-user support (coming soon)
- 💚 Well-loved by the community
- 🪶 Lightweight, fast, and easy to deploy
- 🔐 Rate limiting and CORS support
- 📊 Comprehensive logging with Zerolog
- 🛡️ Path traversal attack prevention
- 📝 Inline file editing for text-based formats

## Tech Stack

- **Backend:** Go 1.25+, Fiber v2 (web framework)
- **Database:** PostgreSQL 17+
- **Logger:** Zerolog
- **ORM:** GORM
- **API:** RESTful with v1 versioning
- **Real-time:** WebSocket with Fiber
- **Testing:** Testify, Go's testing package
- **Clients:** SvelteKit, Native Android (in progress)

## Quick Start

### Prerequisites

- Go 1.25+
- PostgreSQL 17+
- Docker & Docker Compose (optional)

### Installation

```bash
git clone https://github.com/TungstenDevs/AxolotlDrive.git
cd AxolotlDrive
go mod download
```

### Environment Setup

Create a `.env` file:

```env
APP_ENV=development
APP_PORT=8080
DB_HOST=localhost
DB_PORT=5432
DB_USER=axolotldrive
DB_PASS=your_secure_password
DB_NAME=axolotldrive_dev
LOG_LEVEL=debug
```

### Running Locally

```bash
go run ./cmd/main.go
```

### Running with Docker

```bash
docker-compose up -d
```

Visit `http://localhost:8080/api/v1/healthz` to verify the server is running.

## Configuration

All configuration is managed through environment variables. See `.env.development` for reference.

| Variable    | Default     | Description                                      |
| ----------- | ----------- | ------------------------------------------------ |
| `APP_ENV`   | development | Application environment (development/production) |
| `APP_PORT`  | 8080        | Server port                                      |
| `DB_HOST`   | localhost   | PostgreSQL host                                  |
| `DB_PORT`   | 5432        | PostgreSQL port                                  |
| `DB_USER`   | -           | Database user                                    |
| `DB_PASS`   | -           | Database password                                |
| `DB_NAME`   | -           | Database name                                    |
| `LOG_LEVEL` | debug       | Logging level (debug/info/warn/error)            |

## API Documentation

See [API_ENDPOINTS.md](./API_ENDPOINTS.md) for comprehensive API documentation and examples.

## Project Structure

```bash
.
├── cmd
│   └── main.go              # Entry point of the application
├── config
│   └── config.go            # Configuration handling
├── database
│   ├── migrations            # Database migrations
│   └── models                # Database models
├── services
│   ├── health_service.go
│   └── public_files/         # File operations service
├── routes
│   └── routes.go             # Route definitions
├── middlewares/              # Custom middleware
├── DTOs/                     # Data transfer objects
├── logger/                   # Logging setup
├── go.mod
├── go.sum
├── README.md
└── API_ENDPOINTS.md
```

## Testing

Run all tests:

```bash
go test ./...
```

Run with coverage:

```bash
go test -cover ./...
```

Run specific package tests:

```bash
go test ./services/public_files -v
go test ./routes -v -run Integration
```

## Security Features

- ✅ Path traversal attack prevention
- ✅ Hidden file access prevention
- ✅ Dangerous pattern detection
- ✅ File extension validation
- ✅ Rate limiting per IP
- ✅ CORS protection
- ✅ Graceful error handling
- ✅ Request body size limits (30MB)
- ✅ Timeout protection

## Performance

- Chunked file uploads/downloads (10MB per chunk, up to 1TB total)
- Pagination support for file listings
- Optimized path validation
- Concurrent file operations
- Real-time WebSocket notifications

## Database Migrations

Create a new migration:

```bash
make migrate-create name=create_users_table
```

Run migrations:

```bash
make migrate-up
```

Rollback migrations:

```bash
make migrate-down
```

## Development

### Build

```bash
make build
```

### Run

```bash
make run
```

### Run tests

```bash
make test
```

## Contributing

Contributions are welcome! We love community involvement. Please:

- Submit pull requests
- Open issues for bugs and feature requests
- Suggest improvements
- Help with documentation
- Follow Go conventions and include tests

### Code Guidelines

- Use `gofmt` for formatting
- Write meaningful commit messages
- Add tests for new features
- Update documentation
- Keep functions focused and small

## Roadmap

- [ ] Multi-user authentication & authorization
- [ ] File versioning
- [ ] Activity logs
- [ ] Thumbnail generation
- [ ] S3/Cloud storage support
- [ ] File sharing with links
- [ ] Two-factor authentication
- [ ] Native mobile apps (iOS/Android)
- [ ] End-to-end encryption
- [ ] Bandwidth throttling

## License

This project is open source and licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

## Author

**xOphiuchus**

Made with ❤️ for the open source community.

---

### Why Go instead of Rust?

While Rust provides excellent performance and safety guarantees, Go offers a more accessible learning curve and is perfectly suited for self-hosted applications. Go's simplicity and fast compilation make it ideal for contributors and maintainers, allowing the community to grow and collaborate more effectively.

## Support

- 📖 [API Documentation](./API_ENDPOINTS.md)
- 🐛 [Issue Tracker](https://github.com/TungstenDevs/AxolotlDrive/issues)
- 💬 [Discussions](https://github.com/TungstenDevs/AxolotlDrive/discussions)
