https://toolkit.fluxcd.io/get-started/

## Bootstrapping FluxCD v2

1. Get local access (kubectl) to a Kubernetes cluster (on DigitalOcean, for now) 

2. Create a GitHub personal access token ([instructions](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token))

3. Export the token in your command line
   ```sh
   export GITHUB_TOKEN=
   ```

4. Check everything is alright
   ```sh
   flux check --pre
   ```

5. Bootstrap the repository
   ```sh
   flux bootstrap github \
     --owner=hortafcul \
     --repository=infra \
     --team=infra \
     --path=./main-cluster/core
   ```

## Removing FluxCD

Run `flux uninstall`

## Adding SOPS

1. Generate secret key with `./scripts/gen-gpg-key.sh`

2. Apply the secret key to the cluster
   ```
   kubectl create secret generic sops-gpg \
     --namespace=flux-system \
     --from-file=sops.asc=sops.asc
   ```
