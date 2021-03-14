# infra

## Secrets

This repository uses SOPS, integrated with FluxCD, to keep secrets encrypted in
this repository.

To get the ability to encrypt new secrets, add the GPG public key using
`gpg --import ./cluster/prod/sops.pub.asc` 

To be able to decrypt existing secrets, you need to have been given a
`sops.asc` file by an admin which you can import using `gpg --import sops.asc`
