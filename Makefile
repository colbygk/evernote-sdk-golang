
thrift: evernote-thrift/*.thrift
        thrift -strict -nowarn --allow-64bit-consts --allow-neg-keys --gen go:package_prefix=github.com/colbygk/evernote-sdk-golang/,thrift_import=github.com/apache/thrift/lib/go/thrift -I evernote-thrift/src/ -r --out src/github.com/colbygk/evernote-sdk-golang/ evernote-thrift/NoteStore.thrift

.PHONY: thrift
