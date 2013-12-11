require 'rest_client'

# Well done for writing a short class
# but pay attention to indentation
class Takeaway

  # yes, it should be a constant
  # I guess 4 names out of 7 :)
  MENU = [
    {:name => "Caviar Bardem", :price => 50},
    {:name => "Skate Moss", :price => 20},
    {:name => "David Clameron", :price => 10},
    {:name => "Salmon Rushdie", :price => 25},
    {:name => "Tuna Turner", :price => 60},
    {:name => "Doryan Grey", :price => 5},
    {:name => "Prawn French", :price => 2}
   ]

   # why have an empty method?

  def print_menu
    MENU.each do |i| 
      # in general, avoid printing things.
      # Return them instead and let the code that called it
      # to return it
      puts "#{i[:name]} costs #{i[:price]}"
    end
  end

  def send_simple_message
    RestClient.post "https://api:key-2k8fuf0yr24wn5enm1irhkxx3t1wbdv2@api.mailgun.net/v2/sandbox2945.mailgun.org/messages",
    :from => "larahy@gmail.com",
    :to => "larahy@gmail.com",
    :subject => "Famous Fish Order",
    :text => "Thanks for your order, your Famous Fish will be delivered by #{Time.new + 60*60}"
  end
  

  def customer_order(contents, cheque)
    # this line could have been extracted into an external method
   total_price = contents.map {|i|i[:price] * i[:quantity]}.inject(0){|result, element|result + element}
   raise "Where were you during Maths class?!" if total_price != cheque
   send_simple_message
  end

end 