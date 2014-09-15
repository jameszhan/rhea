require 'strscan'

KEYWORDS = %w{if else do while for return}
TYPES = %w{byte int long float double}

scanner = StringScanner.new('int main(void){printf("%s", "Hello World!"); return 0;}')

while(!scanner.eos?)
  case
    when scanner.check( /\"[^"]+\"/ )
      p scanner.scan(/\"[^"]+\"/)
    when scanner.check( /\d+/ )
      p scanner.scan(/\d+/)
    when scanner.check( /\w+/ )
      p scanner.scan(/\w+/)
    when scanner.check( /\s+/ )
      p scanner.scan(/\s+/)
    when scanner.check( /[\{\(\)\}\,\;]/ )
      p scanner.scan(/[\{\(\)\}\,\;]/)
    when scanner.check( /.+/ )
      p scanner.scan(/.+/)
  end
end



