# https://github.com/jqr/dotfiles/blob/master/irbrc.d/local_methods.rb
class Object
  # List class methods which aren't in the superclass.
  def self.local_methods
    (methods - superclass.methods).sort
  end
  
  # List instance methods which aren't in the superclass.
  def local_methods
    (methods - self.class.superclass.instance_methods).sort
  end
end