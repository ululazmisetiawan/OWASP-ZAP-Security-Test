#!/bin/bash
#
actualResult=$1
expectedResult=$2
actualHigh=$3
expectedHigh=$4

echo "======PASSED / FAILED======="
echo "Actual Total Failed : $actualHigh"
echo "Actual Total Failed : $actualResult"
echo "Maximal Failed Allowed : $expectedResult"


float_cmp() {
    awk "BEGIN{exit(!( $* ))}" <&-
}

if float_cmp "$actualHigh >= $expectedHigh"; then
  echo "There's HIGH result"
  exit 1
  #write-error "Test Failed"
elif float_cmp "$actualResult > $expectedResult"; then
  echo "Test Failed because Actual Total Failed is greater or equal than Maximal Failed Allowed"
  exit 1
  #write-error "Test Failed";
else
  echo "Test Passed because Actual Total Failed less than Maximal Failed Allowed"
fi
echo "============================"