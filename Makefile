docs/index.yaml: docs/*.tgz Makefile
	rm -rf docs/_site
	helm repo index docs --url https://backube.github.io/helm-charts
