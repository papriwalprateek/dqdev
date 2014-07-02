require 'treetop'

# Load our custom syntax node classes so the parser can use them
load 'node_extensions.rb'

class Parser
  
  Treetop.load('lib/sexp.treetop')
  @@parser = SexpParser.new
  
  def self.parse(data)
    
    tree = @@parser.parse(data)
    
    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    if(tree.nil?)
      raise Exception, "Parse error at offset: #{@@parser.index}"
    end
    self.clean_tree(tree)
    
    return tree.to_array
  end
  
  private
  
    def self.clean_tree(root_node)
      return if(root_node.elements.nil?)
      root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
      root_node.elements.each {|node| self.clean_tree(node) }
    end

end
