class FileCoder
  attr_accessor :code, :decode
  def self.code(source_file = ARGV[0], output_file = ARGV[1])
    file = File.open(source_file, 'r')
    source = file.read
    file.close
    source = source.gsub(/\W+/, '').downcase
    char_arr = source.split('')
    coded_arr = Array.new
    char_arr.each do |x|
      if x!="z"
        coded_arr.push (x.ord + 1).chr
      else
        coded_arr.push "a"
      end
    end
    file = File.open(output_file, 'w')
    file.puts coded_arr.join('')
    file.close
  end

  def self.decode(source_file = ARGV[0], output_file = ARGV[1])
    file = File.open(source_file, 'r')
    source = file.read
    file.close
    char_arr = source.split('')
    decoded_arr = Array.new
    char_arr.each do |x|
      if x!="a"
        decoded_arr.push (x.ord - 1).chr
      else
        decoded_arr.push "z"
      end
    end
    file = File.open(output_file, 'w')
    file.puts decoded_arr.join('')
    file.close
  end
end

FileCoder.decode
