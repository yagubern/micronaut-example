#!/bin/bash
curl -v \
-H 'X-GitHub-Event: pull_request' \
-H 'X-Hub-Signature: sha1=5e5c6e4674a394f7f0f0352f2b02547c7793f627' \
-H 'Content-Type: application/json' \
-d '{"action": "opened", "pull_request":{"head":{"sha": "47cebedcad9ec95cbb4b405bfcc63f6aac0e3fc7"}},"repository":{"clone_url": "https://github.com/yagubern/micronaut-example.git"}}' \
http://34.145.107.102

#http://localhost:8080

#tkn eventlistener logs github-listener
