{{- define "migrations.fullname" -}}
{{- printf "%s-migrations" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "migrations.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "migrations.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "migrations.selectorLabels" -}}
app.kubernetes.io/name: {{ include "migrations.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
