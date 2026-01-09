# AxolotlDrive Android Client

Native Android client for AxolotlDrive.

## Features

- 📱 Native Android app
- 🔄 Real-time sync
- 📁 Full file management
- 🔍 Search functionality
- 📊 Bandwidth control
- 🛡️ Secure authentication (coming soon)

## Tech Stack

- **Language:** Kotlin
- **Framework:** Jetpack Compose
- **Build Tool:** Gradle
- **Minimum API:** Android 8 (API 26)

## Getting Started

- 🔍 Advanced search with pagination

### Prerequisites

- Android Studio
- Android SDK 26+
- Gradle

### Setup

```bash
cd axolotldrive-android
./gradlew build
```

### Run

Open in Android Studio and run on emulator or device.

## Configuration

Edit `local.properties`:

```properties
api_base_url=http://10.0.2.2:8080/api/v1
ws_base_url=ws://10.0.2.2:8080/api/v1
```

## Project Structure

```bash
axolotldrive-android/
├── app/
│   ├── src/
│   │   ├── main/
│   │   │   ├── kotlin/
│   │   │   ├── res/
│   │   │   └── AndroidManifest.xml
│   │   └── test/
│   └── build.gradle.kts
└── build.gradle.kts
```

## Contributing

Contributions welcome! Please submit pull requests to the main repository.

## License

MIT License - See [LICENSE](../LICENSE) for details.
