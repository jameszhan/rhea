require 'rubygems'
require 'sqlite3'

db = SQLite3::Database.new('/Users/James/Library/Caches/com.apple.safari/Cache.db')

(db.execute 'SELECT * FROM cfurl_cache_response limit 10').each do |record|
  puts "==>"
  record.each do |f|
    puts "\t #{f}"
  end
end

(db.execute 'SELECT entry_ID FROM cfurl_cache_receiver_data limit 10').each do |record|
  puts "+=>"
  record.each do |f|
    puts "\t #{f}"
  end
end

=begin Schema
CREATE TABLE cfurl_cache_blob_data(
  entry_ID INTEGER PRIMARY KEY, 
  response_object BLOB, 
  request_object BLOB, 					 
  proto_props BLOB, 
  user_info BLOB);
  
CREATE TABLE cfurl_cache_receiver_data(
  entry_ID INTEGER PRIMARY KEY, 
  receiver_data BLOB);
  
CREATE TABLE cfurl_cache_response(
  entry_ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, 					 
  version INTEGER, 
  hash_value INTEGER, 
  storage_policy INTEGER, 
  request_key TEXT UNIQUE, 					 
  time_stamp NOT NULL DEFAULT CURRENT_TIMESTAMP);
  
CREATE TABLE cfurl_cache_schema_version(schema_version INTEGER);

CREATE INDEX proto_props_index ON cfurl_cache_blob_data(entry_ID);
CREATE INDEX receiver_data_index ON cfurl_cache_receiver_data(entry_ID);
CREATE INDEX request_key_index ON cfurl_cache_response(request_key);
CREATE INDEX time_stamp_index ON cfurl_cache_response(time_stamp);
=end