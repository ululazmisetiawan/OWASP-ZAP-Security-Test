#!/bin/bash
#
actualResult=$1
expectedResult=$2
actualHigh=$3
expectedHigh=$4
actualMedium=$5
expectedMedium=$6
actualLow=$7
expectedLow=$8
actualInformational=$9
expectedInformational=$10

echo "======PASSED / FAILED======="
echo "High Result : $actualHigh"
echo "Medium Result : $actualMedium"
echo "Low Result : $actualLow"
echo "Informational Result : $actualInformational"
echo "Actual Total Failed : $actualResult"
echo "Maximal Failed Allowed : $expectedResult"


float_cmp() {
    awk "BEGIN{exit(!( $* ))}" <&-
}

if float_cmp "$actualHigh >= $expectedHigh"; then
  echo "There's HIGH result"
  exit 1
  #write-error "Test Failed"
elif float_cmp "$actualMedium >= $expectedMedium"; then
  echo "There's Medium result"
  exit 1
  #write-error "Test Failed"
elif float_cmp "$actualLow >= $expectedLow"; then
  echo "There's Low result"
  exit 1
  #write-error "Test Failed"
elif float_cmp "$actualInformational >= $expectedInformational"; then
  echo "There's Informational result"
  exit 1
  #write-error "Test Failed"
elif float_cmp "$actualResult >= $expectedResult"; then
  echo "Test Failed because Actual Total Failed is greater or equal than Maximal Failed Allowed"
  exit 1
  #write-error "Test Failed";
else
  echo "Test Passed because Actual Total Failed less than Maximal Failed Allowed"
fi
echo "============================"