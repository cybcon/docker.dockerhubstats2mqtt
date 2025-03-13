# Quick reference

Maintained by: [Michael Oberdorf IT-Consulting](https://www.oberdorf-itc.de/)

Source code: [GitHub](https://github.com/cybcon/docker.dockerhubstats2mqtt)

Container image: [DockerHub](https://hub.docker.com/r/oitc/dockerhubstats2mqtt)

<!-- SHIELD GROUP -->
[![][github-action-test-shield]][github-action-test-link]
[![][github-action-release-shield]][github-action-release-link]
[![][github-release-shield]][github-release-link]
[![][github-releasedate-shield]][github-releasedate-link]
[![][github-stars-shield]][github-stars-link]
[![][github-forks-shield]][github-forks-link]
[![][github-issues-shield]][github-issues-link]
[![][github-license-shield]][github-license-link]

[![][docker-release-shield]][docker-release-link]
[![][docker-pulls-shield]][docker-pulls-link]
[![][docker-stars-shield]][docker-stars-link]
[![][docker-size-shield]][docker-size-link]


# Supported tags and respective `Dockerfile` links

* [`latest`, `1.0.2`](https://github.com/cybcon/docker.dockerhubstats2mqtt/blob/v1.0.2/Dockerfile)
* [`1.0.1`](https://github.com/cybcon/docker.dockerhubstats2mqtt/blob/v1.0.1/Dockerfile)
* [`1.0.0`](https://github.com/cybcon/docker.dockerhubstats2mqtt/blob/v1.0.0/Dockerfile)

# Summary

The container image is based on Alpine Linux and sends a curl request result with the [mosquitto-client](https://mosquitto.org/)
to a MQTT server topic.

# Prerequisites to run the docker container
You need an MQTT server to send the data to it.

# Configuration
## Container configuration

The container grab the configuration via environment variables.

| Environment variable name | Description | Required | Default value |
|--|--|--|--|
| `MQTT_SERVER` | The MQTT server hostname or IP address | **OPTIONAL** | `localhost` |
| `MQTT_PORT` | The TCP port of the MQTT server | **OPTIONAL** | `1883` |
| `MQTT_TLS_enabled` | Should SSL communication be enabled (`true`) or not (`false`) | **OPTIONAL** | `false` |
| `MQTT_CACERT_FILE` | If TLS is enabled, the path to the CA certificate file to validate the MQTT server certificate | **OPTIONAL** | |
| `MQTT_TLS_no_hostname_validation` | If TLS is enabled, skip the hostname validation of the TLS certificate | **OPTIONAL** | `false` |
| `MQTT_USER` | The MQTT username for MQTT authentication | **OPTIONAL** | |
| `MQTT_PASSWORD` | The MQTT password for MQTT authentication | **OPTIONAL** | |
| `MQTT_PASSWORD_FILE` | The filepath where the MQTT password is stored for MQTT authentication | **OPTIONAL** | |
| `MQTT_TOPIC` | The MQTT topic to send the speedtest results to | **MANDATORY** | |
| `MQTT_RETAIN`| Set the retain flag when publishing the speedtest result to MQTT topic | **OPTIONAL** | `false` |
| `REPOSITORIES` | A whitespace separated list of dockerhub repositories where to collect the statistics | **MANDATORY** | |

# Docker compose configuration

```yaml
services:
  dockerhubstats2mqtt:
    restart: "no"
    user: 5241:5241
    image: oitc/dockerhubstats2mqtt
    environment:
      MQTT_SERVER: test.mosquitto.org
      MQTT_PORT: 1883
      MQTT_TOPIC: com/docker/hub/repositories/metrics
      REPOSITORIES: oitc/dockerhubstats2mqtt oitc/modbus-server
```

A bigger example can be found here: [`docker-compose.yaml`](./docker-compose.yaml)

# Donate
I would appreciate a small donation to support the further development of my open source projects.

<a href="https://www.paypal.com/donate/?hosted_button_id=BHGJGGUS6RH44" target="_blank"><img src="https://raw.githubusercontent.com/stefan-niedermann/paypal-donate-button/master/paypal-donate-button.png" alt="Donate with PayPal" width="200px"></a>


# License

Copyright (c) 2025 Michael Oberdorf IT-Consulting

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

<!-- LINK GROUP -->
[docker-pulls-link]: https://hub.docker.com/r/oitc/dockerhubstats2mqtt
[docker-pulls-shield]: https://img.shields.io/docker/pulls/oitc/dockerhubstats2mqtt?color=45cc11&labelColor=black&style=flat-square
[docker-release-link]: https://hub.docker.com/r/oitc/dockerhubstats2mqtt
[docker-release-shield]: https://img.shields.io/docker/v/oitc/dockerhubstats2mqtt?color=369eff&label=docker&labelColor=black&logo=docker&logoColor=white&style=flat-square
[docker-size-link]: https://hub.docker.com/r/oitc/dockerhubstats2mqtt
[docker-size-shield]: https://img.shields.io/docker/image-size/oitc/dockerhubstats2mqtt?color=369eff&labelColor=black&style=flat-square
[docker-stars-link]: https://hub.docker.com/r/oitc/dockerhubstats2mqtt
[docker-stars-shield]: https://img.shields.io/docker/stars/oitc/dockerhubstats2mqtt?color=45cc11&labelColor=black&style=flat-square
[github-action-release-link]: https://github.com/cybcon/docker.dockerhubstats2mqtt/actions/workflows/release-from-label.yaml
[github-action-release-shield]: https://img.shields.io/github/actions/workflow/status/cybcon/docker.dockerhubstats2mqtt/release-from-label.yaml?label=release&labelColor=black&logo=githubactions&logoColor=white&style=flat-square
[github-action-test-link]: https://github.com/cybcon/docker.dockerhubstats2mqtt/actions/workflows/container-image-build-validation.yaml
[github-action-test-shield-original]: https://github.com/cybcon/docker.dockerhubstats2mqtt/actions/workflows/container-image-build-validation.yaml/badge.svg
[github-action-test-shield]: https://img.shields.io/github/actions/workflow/status/cybcon/docker.dockerhubstats2mqtt/container-image-build-validation.yaml?label=tests&labelColor=black&logo=githubactions&logoColor=white&style=flat-square
[github-forks-link]: https://github.com/cybcon/docker.dockerhubstats2mqtt/network/members
[github-forks-shield]: https://img.shields.io/github/forks/cybcon/docker.dockerhubstats2mqtt?color=8ae8ff&labelColor=black&style=flat-square
[github-issues-link]: https://github.com/cybcon/docker.dockerhubstats2mqtt/issues
[github-issues-shield]: https://img.shields.io/github/issues/cybcon/docker.dockerhubstats2mqtt?color=ff80eb&labelColor=black&style=flat-square
[github-license-link]: https://github.com/cybcon/docker.dockerhubstats2mqtt/blob/main/LICENSE
[github-license-shield]: https://img.shields.io/badge/license-MIT-blue?labelColor=black&style=flat-square
[github-release-link]: https://github.com/cybcon/docker.dockerhubstats2mqtt/releases
[github-release-shield]: https://img.shields.io/github/v/release/cybcon/docker.dockerhubstats2mqtt?color=369eff&labelColor=black&logo=github&style=flat-square
[github-releasedate-link]: https://github.com/cybcon/docker.dockerhubstats2mqtt/releases
[github-releasedate-shield]: https://img.shields.io/github/release-date/cybcon/docker.dockerhubstats2mqtt?labelColor=black&style=flat-square
[github-stars-link]: https://github.com/cybcon/docker.dockerhubstats2mqtt
[github-stars-shield]: https://img.shields.io/github/stars/cybcon/docker.dockerhubstats2mqtt?color=ffcb47&labelColor=black&style=flat-square
