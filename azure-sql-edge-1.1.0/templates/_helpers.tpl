{{/* Generate basic labels */}}
{{- define "chart.labels" }}
  labels:
    generator: helm
    usage: demos
    date: {{ now | htmlDate }}
{{- end }}