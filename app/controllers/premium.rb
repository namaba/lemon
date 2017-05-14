class Premium < ApplicationController
http_basic_authenticate_with :name => "avenue", :password => "yourname"
layout 'admin'

end