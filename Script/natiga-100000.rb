def say_hello
	require 'uri'
	require 'net/http'
	seatNumber = 100000 #write start seat number
	count = 10
	tempfile = File.new("natega#{seatNumber}.json", 'w')
	number = 0
	for i in 0..100000
	  seatNumber = seatNumber + 1

	  url = URI('http://natega.youm7.com/Home/GetResultStage1/')

	  http = Net::HTTP.new(url.host, url.port)

	  request = Net::HTTP::Post.new(url)
	  request['content-type'] = 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW'
	  request['cache-control'] = 'no-cache'
	  request['postman-token'] = '5acf35cf-82b0-904d-75df-df9bafb2db2d'
	  request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"SeatNumber\"\r\n\r\n#{seatNumber}\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"

	  response = http.request(request)
	  
	  result = response.read_body.chop #remove last letter ==> ]
	  result[0] ='' #remove first letter ==> [
	  tempfile.puts "{\"index\": {}}"
	  tempfile.puts result

	  # puts json: {data: response.read_body}
	  puts seatNumber
	end

	tempfile.close
end

say_hello