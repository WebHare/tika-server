# https://hub.docker.com/r/apache/tika/tags?page=1&ordering=last_updated
FROM apache/tika:1.25-full
MAINTAINER Arnold Hendriks <arnold@webhare.nl>

# Add -nld
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install tesseract-ocr-nld curl

# Copy files
ADD dropins /

# Prepare configuration directory
USER root

ENTRYPOINT []
CMD ["/opt/container/launch.sh"]
