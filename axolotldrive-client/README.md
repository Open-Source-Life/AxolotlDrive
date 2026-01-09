# AxolotlDrive SvelteKit Client

A modern web client for AxolotlDrive built with SvelteKit.

## Features

- 🎨 Responsive design
- ⚡ Real-time file updates via WebSocket
- 📁 Full file management interface
- 🔍 Advanced search functionality
- 📱 Mobile-friendly UI
- 🚀 Fast and optimized

## Tech Stack

- **Frontend:** SvelteKit
- **Styling:** TailwindCSS (or your choice)
- **Real-time:** WebSocket
- **Package Manager:** npm/pnpm

## Getting Started

### Prerequisites

- Node.js 18+
- npm or pnpm

### Installation

```bash
cd axolotldrive-client
npm install
# or
pnpm install
```

### Development

```bash
npm run dev
```

Visit `http://localhost:5173`

### Build

```bash
npm run build
```

### Preview

```bash
npm run preview
```

## Configuration

Create `.env.local`:

```env
VITE_API_URL=http://localhost:8080/api/v1
VITE_WS_URL=ws://localhost:8080/api/v1
```

## Project Structure

```bash
axolotldrive-client/
├── src/
│   ├── routes/
│   ├── components/
│   ├── lib/
│   │   ├── api.ts
│   │   ├── websocket.ts
│   │   └── store.ts
│   └── app.svelte
├── static/
└── svelte.config.js
```

## Contributing

Contributions welcome! Please submit pull requests to the main repository.

## License

MIT License - See [LICENSE](../LICENSE) for details.
