require_relative '../lib/takeaway'

describe Takeaway do 

  let (:famous_fish) {Takeaway.new}
  let (:menu) {[
    {:name => "Caviar Bardem", :price => 50},
    {:name => "Skate Moss", :price => 20},
    {:name => "David Clameron", :price => 10},
    {:name => "Salmon Rushdie", :price => 25},
    {:name => "Tuna Turner", :price => 60},
    {:name => "Doryan Grey", :price => 5}]} 
  let (:contents) {[
    {:name => "Caviar Bardem", :price => 50, :quantity => 1},
    {:name => "Skate Moss", :price => 20, :quantity => 1},
    {:name => "David Clameron", :price => 10, :quantity => 2},
    {:name => "Tuna Turner", :price => 60, :quantity => 1}]}  
  let (:cheque1) {145}  
  let (:cheque2) {150}            

  context 'Menu' do 

    # don't test the presence for the menu in the first place
    it 'should have a menu that can be printed on request' do      
      # if you're testing for something to not to raise an error
      # it should be passed as a block or a lambda:
      # expect { famous_fish.print_menu }.not_to raise_error
      expect(famous_fish.print_menu).not_to raise_error
    end

    # nice three tests
    it 'should raise error if customers has paid incorrectly' do
      expect(lambda { famous_fish.customer_order(contents, cheque1) }).to raise_error(RuntimeError)
    end

    it 'should not raise error message if payment is correct' do
      # you forgot to stub send_simple_message
      # so this test sends it every time I run a test suite
      expect(famous_fish.customer_order(contents, cheque2)).not_to raise_error
    end

    it 'should send a confirmation text message if payment is correct' do
      famous_fish.stub(:send_simple_message)
      famous_fish.should_receive(:send_simple_message).once  
      famous_fish.customer_order(contents, cheque2) 
    end


  end

end
