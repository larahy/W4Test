require_relative '../lib/task1'

describe Array do

  let (:list) {[3,4,2]}

  context '.implant should replicate .inject'do
    
    it 'and should take an argument and a block of code' do
      expect(list.implant(0) {|sum, n| sum + n}).to eq(9)
    end

    it 'take able to take longer blocks' do
      sealife = ["catfish","dogfish", "cod"]
      expect(sealife.implant() {|animal, word| animal.length > word.length ? animal : word }).to eq("dogfish")
    end

    it 'should be able to do multiplication without an argument' do
      expect(list.implant() {|result, element| result * element}).to eq(24)
    end



  end

end