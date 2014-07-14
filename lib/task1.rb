class Array

  def implant(startpoint = nil) # takes an argument and a block
    result = startpoint || first
    array = startpoint ? self : slice(1..-1)
    array.each do |element| 
      result = yield(result, element) # block executed once for every element in the array and result updated each time
    end
    result # delivers the final value, array, whatever
  end
end
