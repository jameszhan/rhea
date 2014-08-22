# encoding: UTF-8


#open("www.csdn.net.sql").each{|line| p line}

require 'sqlite3'

db = SQLite3::Database.new("password.db")

sql = <<SQL
  create table if not exists dictionary (
    name varchar2(64) not null,
    email varchar2(64),
    password varchar2(64),
    domain varchar2(64),
    unique(name, domain)
  );
SQL
db.execute(sql);

rs = db.execute("select * from dictionary");

if rs.empty?
  #p open("www.csdn.net.sql").external_encoding
  open("www.csdn.net.sql", "rb:iso8859-1") do|io|
    total = 0
    matches = 0
    io.each_line do|line|
      total += 1
      begin
        line.encode!("utf-8")
        #groups = line.split(/\s#\s/)
        #p groups unless groups.length == 3

        line.scan(/^(.+?)\s#\s(.+?)\s#\s(.+)$/)do |matched|
          sql = "insert into dictionary values('#{matched[0]}', '#{matched[2].strip!}', '#{matched[1]}', 'csdn')"
          db.execute(sql);
          matches += 1
        end
      rescue ArgumentError, SQLite3::SQLException
        puts "#{line} contains illegal character."
      end
    end
    puts total
    puts matches
  end

end













