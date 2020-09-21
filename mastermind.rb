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
   def initialize (color_1,color_2,color_3,color_4)
    @code=[]
    @digits=[]
    4.times do
        self.digits << Digit.new
    end
    self.make_code(color_1,color_2,color_3,color_4)

   end
   #$i=0
   def make_code (*col)
        col.each_with_index do |color,index | 
            self.code << self.digits[index].colors[color]
        end    
       # self.code << self.digits[$i].colors[col]
       #$i+=1
       
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
     result
end          

class CrackCode
    attr_accessor :value, :solution
    def initialize(result)
       @value = self.value_code(result) 
       @solution=[]
    end    
    def value_code(code_value)
    code_value.reduce(0) do |value,char|
         if char=="a"
            value +=2
         elsif char=="b"
            value +=1    
         else value+=0    
         end
         value
        end         
    end
    def firs_step #search for the colors that arent in the code 
    
    end

end

codigo = Code.new(1,0,4,5).code
codigo.map { |col| puts col.color[:name]}
 
#puts crack_code(check_code(codigo))