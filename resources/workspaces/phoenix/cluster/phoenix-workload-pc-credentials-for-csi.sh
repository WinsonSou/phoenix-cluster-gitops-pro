cat << EOF > phoenix-workload-pc-credentials-for-csi.yaml
apiVersion: v1
data:
  key: MTEuMTEuMTEuMTE6OTQ0MDp0ZXN0OnRlc3QK
kind: Secret
metadata:
  labels:
    cluster.x-k8s.io/provider: nutanix
  name: phoenix-workload-pc-credentials-for-csi
  namespace: phoenix-workspace
type: Opaque
EOF

kubeseal --format yaml --scope cluster-wide < phoenix-workload-pc-credentials-for-csi.yaml > phoenix-workload-pc-credentials-for-csi-sealed.yaml
