#!/bin/bash

docker run -it --rm \
  --name rust-warp-react \
  --privileged \
  --net=host \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --env=DISPLAY \
  -p 3030:3030 \
  --env=QT_X11_NO_MITSHM=1 \
  -v $(pwd):/root/rust-warp-react \
  -w /root/rust-warp-react \
  rust-warp-react:latest
