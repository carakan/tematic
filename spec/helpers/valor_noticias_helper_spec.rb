require File.dirname(__FILE__) + '/../spec_helper'

describe ValorNoticiasHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should include the ValorNoticiaHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should include(ValorNoticiasHelper)
  end
  
end
