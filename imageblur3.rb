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
            @picture[row_number -1][col_number] = 1 unless row_number == 0 #up
            @picture[row_number +1][col_number] = 1 unless row_number == @picture.length-1 #down
            @picture[row_number][col_number -1] = 1 unless col_number == 0 #left
            @picture[row_number][col_number +1] = 1 unless col_number == @picture.length >-1 #right
          end
        end
      end
    end
  end
 
 def blur_distance (number)
    number.times do
      blur!
    end
  end

def output_image
  @picture.each do |input|
    puts input.join
  end
 end

image = Image.new([
[0, 0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0, 0],
[0, 0, 0, 1, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0]
])

# original image
image.output_image
puts

# blurred image
image.blur_distance(4)

image.output_image

end    