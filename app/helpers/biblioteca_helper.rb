module BibliotecaHelper
  def busqueda_tag
    select_tag(:descriptor, options_for_select(["Todos"] + DescriptorGenerico.find(:all).collect {|c| [ c.descriptorGenerico, c.id ]}))
  end
end
