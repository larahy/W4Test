require_relative '../lib/task1'

describe Array do

  let (:list) {[3,4,2]}

  # too few tests :)
  # Let me write one that will fail. If you wrote it (and others),
  # it'd expose some bugs in implant()
  context '.implant should replicate .inject'do
    
    it 'and should take an argument and a block of code' do
      expect(list.implant(0) {|sum, n| sum + n}).to eq(9)
    end

    it 'should be sum an array without an argument' do
      expect(list.implant {|sum, n| sum + n}.to eq(9))
    end

  end

end