require 'base64'
require 'openssl'
require 'digest/sha1'

policy_document =<<DOC
{"expiration": "2016-01-01T00:00:00Z",
  "conditions": [ 
    {"bucket": "james3rails"}, 
    ["starts-with", "$key", "uploads/"],
    {"acl": "private"},
    {"success_action_redirect": "http://localhost:3000/"},
    ["starts-with", "$Content-Type", ""],
    ["content-length-range", 0, 1048576]
  ]
}
DOC


policy = Base64.encode64(policy_document).gsub("\n","")
aws_secret_key = "rWpimtpQzB4oD9/E2cZM0mFJ8FadCiet45LA0bwu"

puts policy

signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'),  aws_secret_key, policy)).gsub("\n","")

puts signature