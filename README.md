# Infrastructure for EddieHub

We are going to redo the infrastructure as code for LinkFree and we will be using Terraform and Civo to do this.

## Existing Infrastructure

We currently have our infrastructure split into different areas. We have monitoring, which is made up of promtail, grafana and loki. We have networking, which is made up of a cert, a domain, the ingress, ingress controller and nginx. We have storage which is made up of DigitalOcean spaces. We also have Teleport set up.

Apps are split into the api, databases and also for the kubernetes cluster itself.

## New Infrastructure