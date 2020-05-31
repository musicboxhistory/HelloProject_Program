#!/usr/bin/ruby

require 'google_drive'
require "cgi"

input = CGI.new
artist = input["artist"]
setlist = input["setlist"]

print "Content-type: text/html\n\n"
print "<html>\n"
print "<head><title>setlist</title></head>\n"
print "<body><center>\n"

session = GoogleDrive::Session.from_config("xxxxxx.json")

case artist
when "hello" then
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
when "morning" then
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
when "angerme" then
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
when "juice" then
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
when "camellia" then
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
when "beyonds" then
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
when "trainee" then
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
else
  print "?~A~]?~A??~V"
end
  
ws = sp.worksheets[setlist.to_i]

print "<div style=\"width: 100%; font-size: 40px; font-weight: bold; text-align: center;\">\n"
print ws.title
print "\n</div>\n"

print "<table border=\"1\" width=\"500\" cellspacing=\"0\" cellpadding=\"5\">"
for row in 1..ws.num_rows
  print "<tr>\n"
  for col in 1..ws.num_cols
    print "<th>"
    data = ws[row, col]
    print data
    print "</th>"
  end
  print "</tr>\n"
end

print "</table>\n"
print "</center></body>\n</html>\n"
