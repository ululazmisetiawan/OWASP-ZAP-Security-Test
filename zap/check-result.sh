#!/bin/bash
#
actualResult=$1
expectedResult=$2

echo "======PASSED / FAILED======="
echo "Actual Total Failed : $actualResult"
echo "Expected Total Failed : $expectedResult"


float_cmp() {
    awk "BEGIN{exit(!( $* ))}" <&-
}

if float_cmp "$actualResult > $expectedResult"; then
  echo "Test Passed because Actual Total Failed is greater or equal than Expected Total Failed"
else
  echo "Test Failed because Actual Total Failed less than Expected Total Failed"
  exit 1
  #write-error "Test Failed";
fi
echo "============================"