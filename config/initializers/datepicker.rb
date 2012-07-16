class DatepickerInput < FormtasticBootstrap::Inputs::StringInput
  def input_html_options
    unless object.nil?
      value = I18n.l(object.send(method))
    else
      value =""
    end
    super.merge(:class => "#{super[:class]}datepicker", :value => value)
  end
end