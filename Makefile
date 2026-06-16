LANG := \
	d \
	go \
	nim \
	python \
	rust \
	zig \

TARGETS := $(addsuffix -test,$(LANG))

CFLAGS = -fPIC

.PHONY: all clean $(TARGETS)

all: $(TARGETS)
	@echo "--- Tests in all language completed ---"

c/lib.o: c/lib.c c/lib.h
c/lib.so: c/lib.o
	${CC} -shared ${LDFLAGS} -o $@ $^

d-test:
	@echo "--- Running D tests ---"
	dub test

go-test:
	@echo "--- Running Go tests ---"
	go test ./...

nim-test:
	@echo "--- Running Nim tests ---"
	nimble test

python-test: c/lib.so
	@echo "--- Running Python tests ---"
	uv run python -m unittest discover -s python

rust-test:
	@echo "--- Running Rust tests ---"
	cargo test

zig-test:
	@echo "--- Running Zig tests ---"
	zig build test --summary all

clean:
	git clean -xdf
