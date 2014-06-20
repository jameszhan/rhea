# encoding: UTF-8

require 'open-uri'
require 'json'

url = "http://bingbops.b2b.alibaba-inc.com/buyoffer/user_profile_data_syn.json?userTypes=com,tmall,taobao"
open(url) do|f|
  ret = result = JSON.parse(f.read)
  user_ids = ret['data']['userProfileList'].map{|e| e['memberId']}
  p user_ids
end