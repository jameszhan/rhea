require File.expand_path(__dir__ + '/config')

(first, second) = ARGV
s3 = AWS::S3.new
case first
when 'list' 
  puts "List buckets"
  puts s3.buckets.map{|bucket| "#{bucket.name} => #{bucket.url} \n\t#{bucket.objects.map(&:key).join("\n\t")}" }
  exit
when nil 
    puts "Usage: upload_file.rb <BUCKET_NAME> <FILE_NAME>"
    exit 1
else
  if second 
    bucket_name, file_name = first, second
  else
    puts "Usage: upload_file.rb <BUCKET_NAME> <FILE_NAME>"
    exit 1
  end
end


# get an instance of the S3 interface using the default configuration




# create a bucket
b = s3.buckets.create(bucket_name) 

# upload a file
basename = File.basename(file_name)
o = b.objects[basename]
o.write(:file => file_name)

puts "Uploaded #{file_name} to:"
puts o.public_url

# generate a presigned URL
puts "\nUse this URL to download the file:"
puts o.url_for(:read)

puts "(press any key to delete the object)"
$stdin.getc

o.delete