library:
	mkdir -p obj/
	ocamlfind ocamlopt -a\
		-package sexplib\
		-package ppx_sexp_conv\
		-package ppx_deriving.show\
		-package core\
		-thread\
		src/service.mli src/service.ml -I src -o obj/service.cmxa

main:
	ocamlfind ocamlopt\
		-package sexplib\
		-package ppx_deriving.show\
		-package ppx_sexp_conv\
		-package core\
		-thread\
		-linkpkg\
		-I src -obj/service.cmxa src/main.ml -o bin/main

test:
	mkdir -p test/bin
	make library
	ocamlfind ocamlopt\
		-package sexplib\
		-package ppx_deriving.show\
		-package ppx_sexp_conv\
		-package core\
		-thread\
		-linkpkg\
		-I src obj/service.cmxa test/parsetest.ml -o test/bin/parsetest
	cd test && ruby runtests.rb && cd ..

clean:
	rm src/*.cm* ; rm src/*.o ; rm src/*.a ; rm obj/* ; rm bin/*
