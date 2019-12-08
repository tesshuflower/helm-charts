docs/index.yaml: docs/*.tgz
	helm repo index docs --url https://backube.github.io/helm-charts
