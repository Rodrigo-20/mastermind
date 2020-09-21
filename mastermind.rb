# @colors= {
#    :RED => 0 ,
#    :GREEN => 0,
#    :BLUE => 0,
#    :YELLOW => 0,
#    :ORANGE => 0,
#    :PINK => 0
#}

class Color
    attr_accessor :color 
    def initialize(name,pos)
    @color = {
        :name => name,
        :value => 0,
        :pos => pos
    }
    end
end

class Digit 
    attr_accessor :colors, :index
    #$some_colors=["red","blue","green","yellow","orange","pink"]
    def initialize
        @colors=[]
        @index
        self.add_colors
        #6.times do
        #    $some_colors.map {|color| self.colors << Color.new(color)}
        #end     
    end    
    def add_colors
        some_colors=["red","blue","green","yellow","orange","pink"]
        6.times do
            some_colors.each_with_index {|color,index| self.colors << Color.new(color,index)}
        end     
    end        

end

class Code
    attr_accessor :code, :digits
   def initialize 
    @code=[]
    @digits=[]
    4.times do
        self.digits << Digit.new 
    end     
   end

   def make_code (color_1,color_2,color_3,color_4)
     
        self.code << self.digits[0].colors[color_1]
        self.code << self.digits[0].colors[color_2]
        self.code << self.digits[0].colors[color_3]
        self.code << self.digits[0].colors[color_4]
       
   end 

end    

def check_code(code)
    result=[]
    master_code=[1,2,3,4]
    my_code=code.map { |color| color.color[:pos] }
    master_code.each_with_index do |master_num,master_index|  
        my_code.each_with_index do |my_num,my_index| 
          if  my_num == master_num
            if my_index == master_index
                result << "a"
            else result << "b"
            end

          end
        end
    end
    puts result
end          

codigo = Code.new.make_code(0,1,2,3) 

check_code(codigo)