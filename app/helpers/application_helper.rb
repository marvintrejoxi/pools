module ApplicationHelper
  def css_boostrap_table
    "table table-hover"
  end

  def btn_success
    "btn btn-success"
  end

  def btn_default
    "btn btn-default"
  end

  def btn_primary
    "btn btn-primary"
  end

  def link_to_edit_with_remote( url, css_class=nil )
    link_to url, class: 'btn btn-default btn-sm', title: 'Editar', remote: true do
      content_tag(:i, nil, class: 'fa fa-edit')
    end
  end

  def format_time(time)
    time.strftime("%H:%M") rescue '--:--'
  end

  def format_date(date)
    date.strftime("%Y-%m-%d") rescue ''
  end

  def format_complete_date(date)
    I18n.l(date.to_date, format: "%A %d de %B del %Y")
  end

end
