#!/bin/bash
#
actualThroughput=$1
expectedThroughput=$2

echo "Actual Throughput: $actualThroughput"
echo "Expected Throughput: $expectedThroughput"
echo "====="

if  "$actualThroughput >= $expectedThroughput"; then
  echo "Test Passed because actual throughput is greater or equal than expected throughput"
else
  echo "Test Throughput Failed because actual throughput less than expected throughput"
  exit 1
  #write-error "Test Failed";
fi