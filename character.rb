class ReadFile
  attr_accessor :file, :text
    def initialize(file_name)
      @file = File.open(file_name, 'r')
      @text = @file.read
    end
    def text_to_hash
      @text = @text.chomp
      @text.gsub!(/[,.„“\/():–‒-]/, '')
      @text.gsub!(' ', '').downcase!
      @text.gsub!('[', '')
      @text.gsub!(']', '')
      @text.gsub!('!', '')
      @text.gsub!('\n', '')
      @text.gsub!('\"', '')
      @text.gsub!('?', '')
      word_hsh = Hash.new(0)
      @text = @text.split('')
      @text.each {|x| word_hsh[x] += 1}
      return word_hsh
    end
  end

    a=ReadFile.new("Random_text.txt")
    puts a.text_to_hash
