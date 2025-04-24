#!/bin/bash
# launch_ethernal_local.sh
# Installs Ethernal globally, sets environment variables, and runs it locally.

# --- Configuration Variables (edit as needed) ---
ETH_NODE_URL="${ETH_NODE_URL:-https://data-seed-prebsc-1-s1.binance.org:8545}"
HOST="${HOST:-localhost}"
PORT="${PORT:-8000}"
ETHERNAL_EMAIL="${ETHERNAL_EMAIL:-help.cfifa23@gmail.com}"
ETHERNAL_PASSWORD="${ETHERNAL_PASSWORD:-aiddyr313}"
ETHERNAL_TOKEN="${ETHERNAL_TOKEN:-eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJlYmFzZVVzZXJJZCI6Im1DQXRVY3pFWkdlNUtHZ3pZWm5Cc3VNck9iWjIiLCJhcGlLZXkiOiJKWjY5NkJYLVdSWTQ0VlMtR0FFODBSVy1QUlJYR1NEXHUwMDAxIiwiaWF0IjoxNzQ0OTI3MDE4fQ.KAkFgHaA7Z7x1lVJhEAoCln7p1DddlyjjAMs7_P8r6c}"

# --- Check for Node.js ---
if ! command -v node &>/dev/null || ! command -v npm &>/dev/null; then
    echo "❌ Node.js and npm are required but not installed. Please install them first."
    exit 1
fi

# --- Install Ethernal CLI if not installed ---
if ! command -v ethernal &>/dev/null; then
    echo "📦 Installing Ethernal CLI globally..."
    npm install -g ethernal
else
    echo "✅ Ethernal CLI already installed."
fi

# --- Export required environment variables ---
echo "🔐 Setting environment variables..."
export ETHERNAL_EMAIL="$ETHERNAL_EMAIL"
export ETHERNAL_PASSWORD="$ETHERNAL_PASSWORD"
export ETHERNAL_TOKEN="$ETHERNAL_TOKEN"

# --- Launch Ethernal Explorer locally ---
echo "🚀 Launching Ethernal Explorer at http://$HOST:$PORT"
ethernal --host "$HOST" --port "$PORT" --rpcUrl "$ETH_NODE_URL"

# --- Start listening for transactions ---
sleep 2  # give a second for the connection to start
echo "👂 Starting Ethernal listener..."
ethernal listen --local