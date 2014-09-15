require 'excon'
require 'base64'
require './hmac'
require './util'

include Util

@scheme = "https"
@host = "s3.amazonaws.com"
@path = "/"

@url = "#{@scheme}://#{@host}#{@path}"

DEFAULT_PARAMS = {
  headers: {
    #"Content-Type" => "application/json", 
    "Date"=> Time.new.utc.strftime("%a, %d %b %Y %H:%M:%S %z")
  },
  :host => "james3rails.s3-us-west-1.amazonaws.com",
  :idempotent => true,
  :path => "/" 
}
def build_params(params = {})
  params = DEFAULT_PARAMS.merge(params)
  params[:headers].merge!('Authorization' => "AWS #{ENV['AWS_ACCESS_KEY_ID']}:#{signature(params)}")
  return params
end


Excon.defaults[:headers]['User-Agent'] ||= "Ruby Agent"

@conn ||= Excon.new(@url, {})
#response =  @conn.request(method: :get) 

streamer = lambda do |chunk, remaining_bytes, total_bytes|
  puts chunk
  puts "Remaining: #{remaining_bytes.to_f / total_bytes}%"
end

params = build_params(path: "/uploads/what_lies_beneath.jpg")
puts params
response = @conn.request(params)
p response.status 
puts response.headers.map{|k, v| "Header -> #{k} : #{v}"}
p response.body


=begin
request => {
  :chunk_size=>1048576, 
  :connect_timeout=>60, 
  :headers=>{
    "User-Agent"=>"fog/1.9.0", 
    "Content-Length"=>52914, 
    "Content-Type"=>"image/jpeg", 
    "x-amz-acl"=>"public-read", 
    "Date"=>"Wed, 27 Feb 2013 05:54:28 +0000", 
    "Authorization"=>"REDACTED", 
    "Host"=>"jamess3rails.s3.amazonaws.com:443"
  }, 
  :idempotent=>true, 
  :instrumentor_name=>"excon", 
  :middlewares=>[
    Excon::Middleware::Instrumentor, 
    Excon::Middleware::Expects, 
    Excon::Middleware::Mock
  ], 
  :mock=>false, 
  :nonblock=>true, 
  :read_timeout=>60, 
  :retry_limit=>4, 
  :ssl_ca_file=>"/usr/local/rvm/gems/ruby-1.9.3-p392/gems/excon-0.18.5/data/cacert.pem", 
  :ssl_verify_peer=>true, 
  :write_timeout=>60, 
  :host=>"jamess3rails.s3.amazonaws.com", 
  :path=>"/uploads%2Funion_creek.jpg", 
  :port=>"443", 
  :query=>nil, 
  :scheme=>"https", 
  :user=>nil, 
  :password=>nil, 
  :family=>0, 
  :body=>#<File:/opt/workdir/s3_rails/public/uploads/tmp/20130227-1354-56275-9637/union_creek.jpg>, 
  :expects=>200, 
  :method=>"PUT", 
  :retries_remaining=>1
}
response => {:body=>"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Error><Code>NoSuchBucket</Code><Message>The specified bucket does not exist</Message><BucketName>jamess3rails</BucketName><RequestId>597BC09EA0C60401</RequestId><HostId>KdTaVk8GUjduBFfLftmCHbvrWuXWXFNTyEzNgcu9EBZV+SRlnriV9ABSN8PTN9hk</HostId></Error>", :headers=>{"x-amz-request-id"=>"597BC09EA0C60401", "x-amz-id-2"=>"KdTaVk8GUjduBFfLftmCHbvrWuXWXFNTyEzNgcu9EBZV+SRlnriV9ABSN8PTN9hk", "Content-Type"=>"application/xml", "Transfer-Enco

WARN  Could not determine content-length of response body. Set content-length of the response or set Response#chunked = true
Fog Connection init => https://s3.amazonaws.com:443/ false {}
[WARNING] fog: the specified s3 bucket name(james_s3_rails) is not a valid dns name, which will negatively impact performance.  For details see: http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketRestrictions.html
params => {
  :body=>#<File:/opt/workdir/s3_rails/public/uploads/tmp/20130227-1340-56067-9774/quiet_place.jpg>, 
  :expects=>200, 
  :headers=>{
    "Content-Length"=>64136, 
    "Content-Type"=>"image/jpeg", 
    "x-amz-acl"=>"public-read", 
    "Date"=>"Wed, 27 Feb 2013 05:40:28 +0000", 
    "Authorization"=>"AWS AKIAJ2KOJSYUAQEAE3YQ:zKOexK+cubrNujtE8O/pZsrpB4o="
  }, 
  :host=>"s3.amazonaws.com", 
  :idempotent=>true, 
  :method=>"PUT", 
  :path=>"/james_s3_rails/uploads%2Fquiet_place.jpg"
}
[WARNING] fog: the specified s3 bucket name(james_s3_rails) is not a valid dns name, which will negatively impact performance.  For details see: http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketRestrictions.html
params => {
  :body=>#<File:/opt/workdir/s3_rails/public/uploads/tmp/20130227-1340-56067-9774/thumb_quiet_place.jpg>, 
  :expects=>200, 
  :headers=>{
    "Content-Length"=>15494, 
    "Content-Type"=>"image/jpeg", 
    "x-amz-acl"=>"public-read", 
    "Date"=>"Wed, 27 Feb 2013 05:40:31 +0000", 
    "Authorization"=>"AWS AKIAJ2KOJSYUAQEAE3YQ:CDrjcp7lz7TSDyocQuuzq9JfKWA="
  }, 
  :host=>"s3.amazonaws.com", 
  :idempotent=>true, 
  :method=>"PUT", 
  :path=>"/james_s3_rails/uploads%2Fthumb_quiet_place.jpg"
}
[WARNING] fog: the specified s3 bucket name(james_s3_rails) is not a valid dns name, which will negatively impact performance.  For details see: http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketRestrictions.html
params => {
  :expects=>204, 
  :headers=>{
    "Date"=>"Wed, 27 Feb 2013 05:40:32 +0000", 
    "Authorization"=>"AWS AKIAJ2KOJSYUAQEAE3YQ:35ry4MX0EmgHwA0ylUC4l++8jOQ="
  }, 
  :host=>"s3.amazonaws.com", 
  :idempotent=>true, 
  :method=>"DELETE", 
  :path=>"/james_s3_rails/uploads%2Funion_creek.jpg"
}
[WARNING] fog: the specified s3 bucket name(james_s3_rails) is not a valid dns name, which will negatively impact performance.  For details see: http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketRestrictions.html
params => {
  :expects=>204, 
  :headers=>{
    "Date"=>"Wed, 27 Feb 2013 05:40:33 +0000", 
    "Authorization"=>"AWS AKIAJ2KOJSYUAQEAE3YQ:A+TM7h+JtKwZ33SWSzPbBj9syjs="
  }, 
  :host=>"s3.amazonaws.com", 
  :idempotent=>true, 
  :method=>"DELETE", 
  :path=>"/james_s3_rails/uploads%2Fthumb_union_creek.jpg"
}
=end