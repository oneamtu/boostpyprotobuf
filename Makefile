.PHONY: setup_test test clean

default: test

setup_test:
	$(MAKE) -C test

test: setup_test
	#LD_LIBRARY_PATH necessary for the test_import_proto to find test_proto.so properly
	LD_LIBRARY_PATH=test python -m unittest discover test *_test.py

clean:
	rm *.pyc
	$(MAKE) clean -C test
