require File.dirname(__FILE__) + '/../spec_helper'

describe InstitucionPeriodisticaHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should include the InstitucionPeriodisticaHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should include(InstitucionPeriodisticaHelper)
  end
  
end
