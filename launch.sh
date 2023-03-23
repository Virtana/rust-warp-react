#!/bin/bash

# Handle past Backend instances since Ctrl+C won't kill the process
# TODO(Jonathan): Get trap working so we close it when this script ends
ps -aux | grep "rust-warp-react" | grep -v "grep" | awk '{print $2}' | xargs kill -9

# Run Backend
cargo run &

# Run Frontend
pushd frontend
# Check that dependencies are installed
if [ ! -d node_modules ]; then
  npm install
fi
npm start
