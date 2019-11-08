{{/*
Common labels
*/}}
{{- define "dockercoins-single.labels" -}}
projectname: dockercoins
environment: {{ .Release.Namespace }}
{{- end }}

{{/*
 Enable probe in uat and prod environment
*/}}
{{- define "dockercoins-single.probe-if-needed" -}}
{{- if contains .Release.Namespace "dockercoins-uat, dockercoins-prod" -}}
livenessProbe:
  httpGet:
    path: /
    port: 80
  initialDelaySeconds: 15
  periodSeconds: 20
readinessProbe:
  httpGet:
    path: /
    port: 80
  initialDelaySeconds: 5
  periodSeconds: 10
{{- end -}}
{{- end -}}
