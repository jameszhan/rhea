require 'zlib'

open '/opt/workdir/webvirt/.git/objects/65/ac0045352577298efc34e948478d7c73542fa4' do |compressed_io|
  zi = Zlib::Inflate.new(Zlib::MAX_WBITS + 32)

  begin
    open "uncompressed.file", "w+" do |uncompressed_io|
      uncompressed_io << zi.inflate(compressed_io.read)
    end
  ensure
    zi.close
  end
end


puts open("uncompressed.file", "w+").read