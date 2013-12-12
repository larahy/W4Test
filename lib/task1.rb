class Array

  def implant(startpoint = nil) # takes an argument and a block
    if startpoint == nil
      result = self[0] 
      array = self.slice(1..-1)
    else
      result = startpoint
      array = self
    end
       #startpoint is first argument to the block
    array.each do |element| 
      result = yield(result, element) # block executed once for every element in the array and result updated each time
      end
      result # delivers the final value, array, whatever
    end
  end


#   # ["alpha", "bravo", "charlie", "bark", "almond"].inject({}) do |result, elm|
#   #   result[elm[0].to_sym] = []
#   #   result[elm[0].to_sym] << elm
#   #   result
#   # end 
