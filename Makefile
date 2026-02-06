.PHONY: setup-css watch-css css-all clean-css build-css run migrate setup down up build docker-migrate docker-makemigrations rebuild faker

setup-css:
	mkdir -p static/css
	npm install -D tailwindcss @tailwindcss/cli
	@printf '@import "tailwindcss";\n\n@theme {\n  --font-family-sans: "Inter", ui-sans-serif, system-ui, sans-serif;\n  --font-family-serif: "Lora", ui-serif, Georgia, serif;\n  --font-family-mono: ui-monospace, "Cascadia Code", "Source Code Pro", Menlo, monospace;\n}\n\n@source "../../templates/**/*.html";\n' > static/css/input.css

watch-css:
	npx @tailwindcss/cli -i static/css/input.css -o static/css/output.css --watch

build-css:
	npx @tailwindcss/cli -i static/css/input.css -o static/css/output.css --minify

css-all: setup-css watch-css

clean-css:
	rm -rf static/css/input.css
	rm -rf static/css/output.css
	rm -rf node_modules package*.json