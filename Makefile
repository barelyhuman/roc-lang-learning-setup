PATH_TO_FILE = ./bin/roc

roc_nightly-macos_apple_silicon-latest.tar.gz:
	curl -sSOL https://github.com/roc-lang/roc/releases/download/nightly/$@ -z ./.tmp/$@ -o $@ 
	mkdir -p bin .tmp 
	tar xf $@ -C bin --strip-components=1 2>/dev/null || true
	mv $@ .tmp/ 2>/dev/null || true

.bin/roc: roc_nightly-macos_apple_silicon-latest.tar.gz

dev:.bin/roc
	./bin/roc dev main.roc

build:
	./bin/roc build main.roc