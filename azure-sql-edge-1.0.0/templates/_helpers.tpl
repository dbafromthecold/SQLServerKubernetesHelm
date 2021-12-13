{{/* Generate basic labels */}}
{{- define "azure-sql-edge.labels" }}
  labels:
    generator: helm
    usage: demos
    date: {{ now | htmlDate }}
{{- end }}