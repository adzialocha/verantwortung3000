module ApplicationHelper

  require 'redcarpet/render_strip'

  def bye

    [
      'Bye!',
      'Ciaopin!',
      'Tschüsstakowitsch!',
      'Ciao',
      'Beep Beep',
      'Bis bald!',
      'Machs gut!',
      'Tschö mit ö!',
      'Hau rein!',
      'Tschüssi!',
      'Tschüssikowski!',
      'Tschüss!',
      'Kuss.',
      'Tschüssikovsky',
      'Tschüssiwinsky',
      'Tschö',
      'Yo.'
    ].sample

  end

  def image_url(source)
    URI.join root_url, image_path(source)
  end

  def li_link_to(body, url, html_options = {})
    active = 'active' if current_page?(url)
    content_tag :li, class: active do
      link_to body, url, html_options
    end
  end

  def alert_class_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def markdown(text)

    unless text.nil?

      render_options = { hard_wrap: true, filter_html: true, no_styles: true, no_images: true, link_attributes: { 'target': '_blank' } }
      markdown_options = { autolink: true, no_intra_emphasis: true }

      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options), markdown_options)

      markdown.render(text).html_safe

    end

  end

  def no_markdown(text)

    unless text.nil?
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown.new())
      markdown.render(text).html_safe
    end

  end

  def nice_timeframe(from, to, only_time=false)

    if only_time and from.day == to.day
      from.strftime('%H:%M') + ' - ' + to.strftime('%H:%M')
    elsif from.day == to.day
      from.strftime('%d.%m. %H:%M') + ' - ' + to.strftime('%H:%M')
    else
      from.strftime('%d.%m. %H:%M') + ' - ' + to.strftime('%d.%m. %H:%M')
    end

  end

  def cover_thumb_url(resource)

    if resource.cover_image.present?
      resource.cover_image.src.thumb.url
    else
      path_to_image 'default.png'
    end

  end

  def link_to_trackable(object, object_type)
    if object
      link_to object_type.downcase, object
    else
      "a #{object_type.downcase} which does not exist anymore"
    end
  end

end
