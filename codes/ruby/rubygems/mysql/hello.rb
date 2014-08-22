require 'mysql'


db = Mysql.real_connect("localhost", "root", "123456", "mysql", 3306);
begin
  tables = db.list_tables;
  ret = db.query("select * from #{tables[-1]}")
  ret.each do |row|
    p row
  end
ensure
  db.close
end