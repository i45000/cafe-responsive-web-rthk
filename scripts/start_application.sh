#!/bin/bash
set -euo pipefail

systemctl restart httpd
systemctl is-active --quiet httpd
