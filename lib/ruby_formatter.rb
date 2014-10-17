require "parser/current"
require "unparser"

class RubyFormatter
  def self.process input
    ast = Parser::CurrentRuby.parse input
    Unparser.unparse(ast) + "\n"
  end
end
