# Glance Dashboard

Personal home dashboard built with [Glance](https://github.com/glanceapp/glance), served via Docker.

## Widgets

**Left column**
- Weather — current conditions based on `GEO_LOC`
- Twitch — live status for followed channels

**Center column**
- Search — Google with bang shortcuts (`!yt`, `!red`, `!steam`, `!amazon`, `!ebay`, `!wh`, `!gh`, `!dh`, `!mdn`)
- RSS — tech news from XDA Developers, Ars Technica, The Verge, Tom's Hardware, Engadget, Wired, Dev.to, Lobsters, Krebs on Security, The Hacker News
- Domain monitors — uptime status for personal and managed websites

**Right column**
- Markets — stock prices for MU, NVDA, YYGH, GOOG, SPY, TSM
- Releases — latest GitHub releases for self-hosted tools (Glance, Dockge, Scrutiny, DIUN, Home Assistant)

## Environment Variables

| Variable | Description |
|---|---|
| `GEO_LOC` | Location for the weather widget (e.g. `Minneapolis, MN`) |
| `GIT_TOKEN` | GitHub personal access token for the releases widget |

## Local Testing

Copy `.env.example` to `.env` and fill in your values:

```powershell
Copy-Item .env.example .env
```

Then run:

```powershell
.\glance-test.ps1
```

Open `http://localhost:8080` to preview. The script loads variables from `.env`, builds the Docker image, and runs the container. The container is removed automatically when stopped (`Ctrl+C`).

## Deployment

Build and push the Docker image, or copy `glance.yml` to your server and run with the official image:

```bash
docker run -d -p 8080:8080 \
  -e GEO_LOC="Minneapolis, MN" \
  -e GIT_TOKEN="your_token" \
  -v ./glance.yml:/app/config/glance.yml \
  glanceapp/glance:latest
```
