all:
	mkdir -p bin/
	ocamlfind ocamlopt -a\
		-package sexplib\
		-package core\
		-thread\
		src/service.mli src/service.ml -I src -o src/service.cmxa
	ocamlfind ocamlopt\
		-package sexplib\
		-package core\
		-thread\
		-linkpkg\
		-I src src/service.cmxa src/main.ml -o bin/main

clean:
	rm src/*.cm* ; rm src/*.o ; rm src/*.a
