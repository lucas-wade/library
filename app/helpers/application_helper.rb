module ApplicationHelper

  def full_title(page_title = '')
    base_title = t('.title')
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def the_logo(library_mode)
    if library_mode == 'library'
      'growbiologo_library.png'
    else
      'growbiologo_classroom.png'
      end
  end


end
