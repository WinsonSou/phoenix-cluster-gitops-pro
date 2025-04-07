cat << EOF > phoenix-workload-pc-credentials.yaml
apiVersion: v1
data:
  #base64 encoded json of: [{"type":"basic_auth","data":{"prismCentral":{"username":"nkp_prismCentral_service_account","password":"nkp_prismCentral_service_account_password"}}}]
  credentials: W3sidHlwZSI6ImJhc2ljX2F1dGgiLCJkYXRhIjp7InByaXNtQ2VudHJhbCI6eyJ1c2VybmFtZSI6InRlc3QiLCJwYXNzd29yZCI6InRlc3QifX19XQo=
kind: Secret
metadata:
  labels:
    cluster.x-k8s.io/provider: nutanix
  name: phoenix-workload-pc-credentials
  namespace: phoenix-workspace
type: Opaque
EOF

kubeseal --format yaml --scope cluster-wide < phoenix-workload-pc-credentials.yaml > phoenix-workload-pc-credentials-sealed.yaml
