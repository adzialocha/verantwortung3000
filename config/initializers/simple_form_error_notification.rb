SimpleForm::ErrorNotification.class_eval do
  def render
    if has_errors?
      template.content_tag(:div, html_options, :role => 'alert') do
        template.content_tag(:button, nil, class: 'close', data: { 'dismiss': 'alert' }, type: 'button' ) {
          template.content_tag(:span, '&times;'.html_safe)
          } + template.content_tag(:p, error_message)
      end
    end
  end
end

