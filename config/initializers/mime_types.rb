Mime::Type.register "text/html", :print
Mime::Type.register "application/pdf", :pdf
Mime::Type.register "application/ms-excel", :xls

Date::MONTHNAMES = [nil] + %w(Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre)
date_formats = {
  :date => '%d/%m/%Y'
}
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(date_formats)
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(date_formats)
