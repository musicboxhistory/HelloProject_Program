#!/usr/bin/ruby

require 'google_drive'
require 'cgi'

print "Content-type: text/html\n\n"
print "<html>\n"
print "<head><title>concert</title></head>\n"
print "<body><center>\n"
print "<form method=\"post\" action=\"setlist.rb\">\n"

input = CGI.new
artist = input["artist"]

session = GoogleDrive::Session.from_config("xxxxxx.json")

print "<div style=\"width: 100%; font-size: 40px; font-weight: bold; text-align: center;\">\n"

case artist
when "hello" then
  print "Hellow Project"
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxxxx")
  print "<input type=\"hidden\" name=\"artist\" value=\"hello\">"
when "morning" then
  print "モーニング娘。"
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxxx")
  print "<input type=\"hidden\" name=\"artist\" value=\"morning\">"
when "angerme" then
  print "アンジュルム"
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxxx")
  print "<input type=\"hidden\" name=\"artist\" value=\"angerme\">"
when "juice" then
  print "Juice=Juice"
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
  print "<input type=\"hidden\" name=\"artist\" value=\"juice\">"
when "camellia" then
  print "つばきファクトリー"
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
  print "<input type=\"hidden\" name=\"artist\" value=\"camellia\">"
when "beyonds" then
  print "BEYOOOOODS"
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
  print "<input type=\"hidden\" name=\"artist\" value=\"beyonds\">"
when "trainee" then
  print "ハロプロ研修生"
  sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/xxxxxxxxxxxxxxxxxxxxxx")
  print "<input type=\"hidden\" name=\"artist\" value=\"trainee\">"
else
  print "その他"
end

print "\n</div>\n"

print "<select name=\"setlist\">\n"

for num in 0..sp.worksheets.length - 1 do
  print "<option value=\""
  print num
  print "\">"
  print sp.worksheets[num].title
  print "</option>\n"
end 

print "</select>\n"
print "<p><input type=\"submit\" value=\"GO!! GO!!\"></p>\n"
print "</form>\n"

print "</center></body>\n</html>\n"
