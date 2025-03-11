FROM alpine:3.21.3

LABEL maintainer="Michael Oberdorf IT-Consulting <info@oberdorf-itc.de>"
LABEL site.local.program.version="1.0.1"

ENV MQTT_SERVER=localhost \
    MQTT_PORT=1883 \
    MQTT_TLS_enabled=false \
    MQTT_TLS_no_hostname_validation=false \
    MQTT_RETAIN=false \
    REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

RUN apk upgrade --available --no-cache --update \
    && apk add --no-cache --update \
       bash=5.2.37-r0 \
       ca-certificates=20241121-r1 \
       curl=8.12.1-r0 \
       jq=1.7.1-r0 \
       mosquitto-clients=2.0.20-r0

COPY --chown=root:root /src /

USER 5241:5241

# Start Process
ENTRYPOINT ["/entrypoint.sh"]
