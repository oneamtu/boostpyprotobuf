all: test_proto.so

test_proto.so: test.proto ../*.py *.proto
	protoc --cpp_out=. test.proto test_package.proto test_import.proto
	../wrapifier.py test.proto test_package.proto test_import.proto
	g++ -fPIC test.pb.cc test.boost.pb.cpp -shared -o test_proto.so -I/usr/include/python2.7 -lprotobuf -lboost_python -lpython2.7
	g++ -fPIC test_package.pb.cc test_package.boost.pb.cpp -shared -o test_package_proto.so -I/usr/include/python2.7 -lprotobuf -lboost_python -lpython2.7
	g++ -fPIC test_import.pb.cc test_import.boost.pb.cpp -shared -o test_import_proto.so -I/usr/include/python2.7 -lprotobuf -lboost_python -lpython2.7 -L. -l:test_proto.so

clean:
	$(RM) *.pyc *.pb.cpp *.pb.h *.pb.cc *.so
