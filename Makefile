APKO_VERSION=0.7.1
APKO=docker run -v "${PWD}":/work cgr.dev/chainguard/apko:${APKO_VERSION}
.PHONEY: clean 

clean:
	rm -f *.spdx.json *.cdx *.tar

all: base dev

%: alpine-%.tar
	docker load < $<

%.tar : %.yaml
	$(APKO) build --use-docker-mediatypes $< $* $@