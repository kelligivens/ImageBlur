class Image

  def initialize (picture)
     @picture = picture
  end

  def get_ones
    ones = []
    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

   def blur!
    ones = get_ones
      @picture.each_with_index do |row, row_number|
        row.each_with_index do |item, col_number|
          ones.each do |found_row_number, found_col_number|

            if row_number == found_row_number && col_number == found_col_number
              @picture[found_row_number -1][found_col_number] = 1 unless found_row_number == 0 #up
              @picture[found_row_number +1][found_col_number] = 1 unless found_row_number >= 3 #down
              @picture[found_row_number][found_col_number -1] = 1 unless found_col_number == 0 #left
              @picture[found_row_number][found_col_number +1] = 1 unless found_col_number >= 3 #right
            end
          end
        end
      end
  end

def output_image
  @picture.each do |i|
    puts i.join(" ")
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

image.output_image
puts
image.blur!
  
image.output_image
end
