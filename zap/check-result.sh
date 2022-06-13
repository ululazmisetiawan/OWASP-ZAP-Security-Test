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

if float_cmp "$actualResult> $expectedResult"; then
  echo "Result : Test FAILED because Actual Total Result greater than Expected Total Result"
  exit 1
  #write-error "Test Failed";
else
  echo "Result : Test PASSED because Actual Total Result is less than Expected Total Result"
fi

echo "============================"