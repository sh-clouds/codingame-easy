class MimeType
  attr_accessor :n, :q
  def initialize
    @N = gets.to_i # Number of elements which make up the association table.
    @Q = gets.to_i # Number Q of file names to be analyzed.
    @file_ext =[]
    @file_mime_type = Array.new
    @N.times do
      # EXT: file extension
      # MT: MIME type.
      @EXT, @MT = gets.split(" ")
      @file_ext << @EXT.downcase
      @file_mime_type << @MT
    end
    @Q.times do
      @FNAME = gets.chomp# One file name per line.
      if  @FNAME[-1] == '.'
        @tab_sotie = "UNKNOWN"
      else
        tab = @FNAME.split('.')
        @file_name_var = tab.first
        @file_ext_var = tab.count > 1 ? tab.last : nil

        if @file_ext.include?(@file_ext_var.to_s.downcase)
          @tab_sotie = @file_mime_type[@file_ext.index(@file_ext_var.to_s.downcase)]
        else
          @tab_sotie = "UNKNOWN"
        end
      end

      puts @tab_sotie
    end
  end
end

testi = MimeType.new