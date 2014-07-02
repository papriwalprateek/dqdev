
module Sexp
  class Is < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value
    end
  end
    class Nearly < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value
    end
  end  

  class Isnot < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value
    end
  end
  
  class Identifier < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value
    end
  end
  
  class Expression < Treetop::Runtime::SyntaxNode
    def to_array
      return self.elements.map{|x| x.to_array}
      #return self.elements[0].to_array
    end
  end
  
  class Body < Treetop::Runtime::SyntaxNode
    def to_array
      arr = self.elements.map {|x| x.to_array}
      if (arr[1]=='=')
        if(arr[2]=='true')
          return '.where(:'+arr[0]+"=>"+arr[2]+")" 
        end
        return '.where(:'+arr[0]+"=>'"+arr[2]+"')"
      elsif(arr[1]=='!=')
        return ""
      elsif(arr[1]=='~')
          return '.where(:'+arr[0]+"=>/"+arr[2]+"/i)"
        end
    end
  end
end