gcc_compiler = /usr/local/bin/g++-9
gcc_options = -std=c++17 -Wall --pedantic-errors

cpp_source = main.cpp
cpp_out = main
cpp_raw_header = all.h
cpp_compiled_header = all.h.gch

${cpp_out} : ${cpp_source} ${cpp_raw_header} ${cpp_compiled_header}
	${gcc_compiler} ${gcc_options} -include ${cpp_raw_header} $< -o $@

${cpp_compiled_header} : ${cpp_raw_header}
	${gcc_compiler} ${gcc_options} -x c++-header -o $@ $<

run : ${cpp_out}
	./${cpp_out}

clean :
	rm -f ./${cpp_out} ./${cpp_compiled_header}

.PHONY :
	run clean
