FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt update && apt install -y ffmpeg

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility

RUN mkdir -p /usr/local/bin /patched-lib
COPY patch.sh docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/patch.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
