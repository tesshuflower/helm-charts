# Welcome

This site contains the Helm charts for the backube organization.

Add this repository:

```console
$ helm repo add backube https://backube.github.io/helm-charts/
"backube" has been added to your repositories
```

List available charts in this repo:

```console
$ helm search repo backube
NAME                    CHART VERSION   APP VERSION     DESCRIPTION
....
```

## Troubleshooting

- If you encounter a problem with a specific chart, please open an issue in in
  the repo for the corresponding application.
- If you are having a problem with the chart repo itself (can't add it, can't
  search, or can't get chart info), please [open an issue in this repo]({{
  site.github.issues_url }}{{ "/new?labels=bug&template=bug_report.md" |
  uri_escape }})
