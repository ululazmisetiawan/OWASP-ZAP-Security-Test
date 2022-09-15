# Introduction 
OWASP ZAP SECURITY TEST

# Getting Started
1. This code can running on Azure Pipeline
2. You can set variabel
3. Can Generate Report

# Build and Test
      docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap-api-scan.py -t 
      http://www.google.com  -> You can set your API
      -f openapi -g api-scan.conf -x OWASP-ZAP-Report.xml -r api-scan-report.html -J api-report.json 
