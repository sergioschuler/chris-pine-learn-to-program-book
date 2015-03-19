# manual_shuffle.rb

def manual_shuffle(unshuffled_ary, shuffled_array = [])
  unshuffled_ary = unshuffled_ary.clone

  if unshuffled_ary.empty?
    return shuffled_array
  else
    index = rand(unshuffled_ary.count)
    shuffled_array << unshuffled_ary[index]
    unshuffled_ary.delete_at(index)
    manual_shuffle(unshuffled_ary, shuffled_array)
  end  
end

ary = ["array", "boba", "calculus", "danish", "elephant"]

3.times { puts manual_shuffle(ary).join(", ") }
