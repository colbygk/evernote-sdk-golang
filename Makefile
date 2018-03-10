TARGET := src/github.com/colbygk/evernote-sdk-golang

thrift:
	thrift -strict -nowarn --allow-64bit-consts --allow-neg-keys --gen go:package_prefix=github.com/colbygk/evernote-sdk-golang/,thrift_import=github.com/apache/thrift/lib/go/thrift -I evernote-thrift/src/ -r --out $(TARGET) evernote-thrift/NoteStore.thrift

all: thrift

clean:
	rm -rf $(TARGET)/edam/*

.PHONY: thrift
