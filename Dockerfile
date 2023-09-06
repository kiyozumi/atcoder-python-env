FROM python:3.11

ENV TZ=Asia/Tokyo

RUN apt-get update \
    && apt install -y --no-install-recommends \
    nodejs \
    npm \
    && npm install -g atcoder-cli \
    && acc config default-task-choice all \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/contest
COPY requirements.txt ./
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

COPY atcoder-cli-nodejs/ /root/.config/atcoder-cli-nodejs/


