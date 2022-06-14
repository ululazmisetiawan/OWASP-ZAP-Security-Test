#!/bin/bash
#
actualResult=$1
expectedResult=$2

echo "======PASSED / FAILED======="
echo "Actual Total Result : $actualResult"
echo "Expected Total Result : $expectedResult"


float_cmp() {
    awk "BEGIN{exit(!( $* ))}" <&-
}

if float_cmp "$actualResult >= $expectedResult"; then
  echo "Test Passed because actual throughput is greater or equal than expected throughput"
else
  echo "Test Throughput Failed because actual throughput less than expected throughput"
  exit 1
  #write-error "Test Failed";
fi
echo "============================"