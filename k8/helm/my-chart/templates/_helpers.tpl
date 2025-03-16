{{- define "helm.labels" -}}
app: {{ default .Chart.Name .Values.app }}
env: test

{{- end }}

