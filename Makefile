# Phony targets is "recipes" and not the name of a file.
.PHONY: all clean enforcexml

all: bin/Spela\ Ekot.shortcut bin/Spela\ kanal.shortcut bin/Sök\ avsnitt.shortcut

bin/Spela\ Ekot.shortcut: src/play-ekot.shortcut
	mkdir -p bin/
	cp "$<" "$@"
	plutil -convert binary1 "$@"

bin/Spela\ kanal.shortcut: src/play-channel.shortcut
	mkdir -p bin/
	cp "$<" "$@"
	plutil -convert binary1 "$@"

bin/Sök\ avsnitt.shortcut: src/search-episode.shortcut
	mkdir -p bin/
	cp "$<" "$@"
	plutil -convert binary1 "$@"

enforcexml:
	ls ./src/*.shortcut | xargs plutil -convert xml1

clean:
	rm -rf bin/
