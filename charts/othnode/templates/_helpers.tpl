{{/*
Expand the name of the chart.
*/}}
{{- define "othnode.name" -}}
{{ .Release.Name }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "othnode.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "release.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "othnode.labels" -}}
helm.sh/chart: {{ include "release.chart" . }}
{{ include "othnode.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "othnode.selectorLabels" -}}
app.kubernetes.io/name: {{ .Release.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



{{/*
Generate dynamic secret name for pod with index
*/}}
{{- define "othnode.secretName" -}}
{{- $podIndex := .podIndex | default 0 }}
{{- printf "%s-%d-env" (include "othnode.name" .) $podIndex }}
{{- end }}
