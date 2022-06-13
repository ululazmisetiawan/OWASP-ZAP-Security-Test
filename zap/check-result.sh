#!/bin/bash
#
actualThroughput=$1
expectedThroughput=$2

echo "======PASSED / FAILED======="
echo "Actual Total Result : $actualThroughput"
echo "Expected Total Result : $expectedThroughput"
echo "============================"
echo "Result :"

float_cmp() {
    awk "BEGIN{exit(!( $* ))}" <&-
}

if float_cmp "$actualThroughput > $expectedThroughput"; then
  echo "Test Throughput FAILED because Actual Total Result greater than Expected Total Result"
  exit 1
  #write-error "Test Failed";
else
  echo "Test PASSED because Actual Total Result is less than Expected Total Result"
fi