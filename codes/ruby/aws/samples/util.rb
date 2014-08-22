module Util
  
  def signature(params)
    @hmac ||= HMAC.new('sha1', ENV['AWS_SECRET_ACCESS_KEY'])
    @host ||= "s3.amazonaws.com"
    string_to_sign =
<<-DATA
#{params[:method].to_s.upcase}
#{params[:headers]['Content-MD5']}
#{params[:headers]['Content-Type']}
#{params[:headers]['Date']}
DATA

    amz_headers, canonical_amz_headers = {}, ''
    for key, value in params[:headers]
      if key[0..5] == 'x-amz-'
        amz_headers[key] = value
      end
    end
    amz_headers = amz_headers.sort {|x, y| x[0] <=> y[0]}
    for key, value in amz_headers
      canonical_amz_headers << "#{key}:#{value}\n"
    end
    string_to_sign << canonical_amz_headers

    subdomain = params[:host].split(".#{@host}").first
    unless subdomain =~ /^(?:[a-z]|\d(?!\d{0,2}(?:\.\d{1,3}){3}$))(?:[a-z0-9]|\.(?![\.\-])|\-(?![\.])){1,61}[a-z0-9]$/
      puts "the specified s3 bucket name(#{subdomain}) is not a valid dns name, which will negatively impact performance.  For details see: http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketRestrictions.html"
      params[:host] = params[:host].split("#{subdomain}.")[-1]
      if params[:path]
        params[:path] = "#{subdomain}/#{params[:path]}"
      else
        params[:path] = subdomain
      end
      subdomain = nil
    end

    canonical_resource  = "/"
    unless subdomain.nil? || subdomain == "/"
      canonical_resource << "#{subdomain.downcase}/"
    end
    canonical_resource << params[:path].to_s
    canonical_resource << '?'
    for key in (params[:query] || {}).keys.sort
      if %w{
        acl
        cors
        delete
        lifecycle
        location
        logging
        notification
        partNumber
        policy
        requestPayment
        response-cache-control
        response-content-disposition
        response-content-encoding
        response-content-language
        response-content-type
        response-expires
        torrent
        uploadId
        uploads
        versionId
        versioning
        versions
        website
      }.include?(key)
        canonical_resource << "#{key}#{"=#{params[:query][key]}" unless params[:query][key].nil?}&"
      end
    end
    canonical_resource.chop!
    string_to_sign << canonical_resource

    signed_string = @hmac.sign(string_to_sign)
    Base64.encode64(signed_string).chomp!
  end


end