module DepartamentosHelper
  def link_to_departamentos
    enlaces = ''
    Departamento.find(:all, :order => 'departamento').each do |dep|
      enlaces += link_to(dep.departamento, dep) + ' | '
    end
    enlaces
  end
end
