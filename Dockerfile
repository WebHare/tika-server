# https://hub.docker.com/r/apache/tika/tags?page=1&ordering=last_updated
FROM apache/tika:3.2.3.0-full
MAINTAINER Arnold Hendriks <arnold@webhare.nl>

USER root

# Add -nld
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install tesseract-ocr-nld curl dumb-init

# Copy files
ADD dropins /

ENTRYPOINT []
CMD ["/opt/container/launch.sh"]
