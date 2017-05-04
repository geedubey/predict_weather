class PerdictWeather < Sinatra::Base
	
	#use Rack::SslEnforcer
	#set :public_folder => "public", :static => true

	get '/' do
		erb :home, :layout=>:layout
	end

	get '/weatherData' do
#=begin	 
		#RestClient.proxy = "http://127.0.0.1:3128"
		if (params['latitude'] != nil && params['longitude'] != nil )
			#jsonResp = RestClient.get 'https://ccc2b117-cb2f-4336-8f32-67c595af1d24:IVuT1S5SS3@twcservice.mybluemix.net:443/api/weather/v2/forecast/daily/10day?units=m&geocode='+params['latitude']+'%2C'+params['longitude']+'&language=en-US'
			jsonResp = RestClient.get 'https://adb8a528-2aae-4927-a75c-4d855411be99:WLrcfFwqE3@twcservice.mybluemix.net:443/api/weather/v1/geocode/'+params['latitude']+'/'+params['longitude']+'/forecast/daily/10day.json'	
		else
			#jsonResp = RestClient.get 'https://ccc2b117-cb2f-4336-8f32-67c595af1d24:IVuT1S5SS3@twcservice.mybluemix.net:443/api/weather/v2/forecast/daily/10day?units=m&geocode=12.97%2C77.59&language=en-US'
			jsonResp = RestClient.get 'https://adb8a528-2aae-4927-a75c-4d855411be99:WLrcfFwqE3@twcservice.mybluemix.net:443/api/weather/v1/geocode/12.97/77.59/forecast/daily/10day.json'
		end
		File.open("nullfile.txt", 'w') { |file| file.write(jsonResp.to_s) }
		rubyhash = JSON.parse(jsonResp)
		metaremoved = rubyhash['forecasts']
		metaremoved.each do |daydata|
			daydata['start'] = daydata['fcst_valid_local'].split("T")[0]+'T12:00:00'
		end
	   @weather = metaremoved.to_json
#=end 
		
	#@weather = File.read("response.json")  
	
	end
	
end


