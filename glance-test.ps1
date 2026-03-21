$envFile = Join-Path $PSScriptRoot ".env"
if (-not (Test-Path $envFile)) {
    Write-Error ".env file not found. Copy .env.example to .env and fill in your values."
    exit 1
}

Get-Content $envFile | ForEach-Object {
    if ($_ -match '^\s*([^#][^=]*?)\s*=\s*(.*)\s*$') {
        [System.Environment]::SetEnvironmentVariable($matches[1], $matches[2], 'Process')
    }
}

docker build -t glance-test .
docker run --rm -p 8080:8080 -e GEO_LOC="$env:GEO_LOC" -e GIT_TOKEN="$env:GIT_TOKEN" glance-test
