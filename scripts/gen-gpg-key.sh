#!/bin/bash

export KEY_NAME="sops-hortafcul.pt"
export KEY_COMMENT="fluxcd secrets"

gpg --batch --full-generate-key <<EOF
%no-protection
Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Expire-Date: 0
Name-Comment: ${KEY_COMMENT}
Name-Real: ${KEY_NAME}
EOF

KEY_FINGERPRINT=$(gpg --list-secret-keys --with-colons "$KEY_NAME" | grep '^fpr:' | cut -d':' -f10 | head -n1)

echo "Fingerprint: $KEY_FINGERPRINT"

gpg --export --armor gpg "$KEY_FINGERPRINT" > sops.pub.asc
gpg --export-secret-keys --armor gpg "$KEY_FINGERPRINT" > sops.asc
