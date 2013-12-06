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

  context 'Menu' do 

    it 'should contain a list of priced dishes' do
      expect(menu.count).to eq(6)
    end 

    it 'should print the menu on request' do
      expect(famous_fish.print_menu).not_to raise_error
    end

    it 'should raise error if customers has paid incorrectly' do
      expect(lambda { famous_fish.customer_order(contents, cheque1) }).to raise_error(RuntimeError)
    end



  end

end
