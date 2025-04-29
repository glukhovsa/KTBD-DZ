FROM python:3.12

COPY requirements.txt .
COPY code /files
RUN bash <<EOF
    set -euo pipefail
    pip install --upgrade pip

    pip install --break-system-packages -r requirements.txt
EOF

ENTRYPOINT python3.12 /files/app.py
