#!/bin/bash
echo `pwd`
index=`cat Sources/XCTestHTMLReport/HTML/index.html | sed 's,",\\\\",g'`
testSummary=`cat Sources/XCTestHTMLReport/HTML/test_summary.html | sed 's,",\\\\",g'`
run=`cat Sources/XCTestHTMLReport/HTML/run.html | sed 's,",\\\\",g'`
device=`cat Sources/XCTestHTMLReport/HTML/device.html | sed 's,",\\\\",g'`
test=`cat Sources/XCTestHTMLReport/HTML/test.html | sed 's,",\\\\",g'`
activity=`cat Sources/XCTestHTMLReport/HTML/activity.html | sed 's,",\\\\",g'`
screenshot=`cat Sources/XCTestHTMLReport/HTML/screenshot.html | sed 's,",\\\\",g'`
text=`cat Sources/XCTestHTMLReport/HTML/text.html | sed 's,",\\\\",g'`

content="
/// DO NOT EDIT! This file is autogenerated by createTemplates.sh

struct HTMLTemplates
{
  static let index = \"\"\"
$index
  \"\"\"

  static let device = \"\"\"
  $device
  \"\"\"

  static let run = \"\"\"
$run
  \"\"\"

  static let testSummary = \"\"\"
$testSummary
  \"\"\"

  static let test = \"\"\"
$test
  \"\"\"

  static let activity = \"\"\"
$activity
  \"\"\"

  static let screenshot = \"\"\"
$screenshot
  \"\"\"

  static let text = \"\"\"
$text
  \"\"\"
}
"
echo "$content" > 'Sources/XCTestHTMLReport/Classes/HTMLTemplates.swift'
