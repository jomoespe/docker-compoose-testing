#!/usr/bin/env bash
RET=0

if curl -s http://app:8080/hi | grep -q 'hello <unknown>' ; then
	echo "Test 1 passed"
else
	echo "Test 1 failed!"
	RET=1
fi

if curl -s http://app:8080/hi?name=test | grep -q 'hello test' ; then
	echo "Test 2 passed"
else
	echo "Test 2 failed!"
	RET=2
fi

exit $RET
