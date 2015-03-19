# manual_sort_array.rb

def manual_sorter(unsorted_ary, sorted_ary = [])
  if unsorted_ary.empty?
    return sorted_ary
  else
    middle = unsorted_ary.pop
    less = manual_sorter( unsorted_ary.select { |x| x.downcase < middle.downcase } )
    more = manual_sorter( unsorted_ary.select { |x| x.downcase >= middle.downcase } )
    return sorted_ary = manual_sorter(less) + [middle] + manual_sorter(more)
  end
end

array = ["John", "Ringo", "Paul", "George", "garoto", "Ringo", "Ringo again", "Bryan", "Ukulele", "Cabeça"]

print manual_sorter(array)
