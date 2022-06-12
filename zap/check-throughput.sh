#!/bin/bash
#
actualThroughput=$1
expectedThroughput=$2
inputResultRisk=$3

echo "Result : $inputResultRisk"
echo "Actual Throughput : $actualThroughput"
echo "Expected Throughput : $expectedThroughput"
echo "====="

float_cmp() {
    awk "BEGIN{exit(!( $* ))}" <&-
}

if [[ "$inputResultRisk" == *"High"* ]]; then
  echo "Theres result high"
if else float_cmp "$actualThroughput >= $expectedThroughput"; then
  echo "Test Throughput Failed because actual throughput less than expected throughput"
  exit 1
  #write-error "Test Failed";
else
  echo "Test Passed because actual throughput is greater or equal than expected throughput"
fi