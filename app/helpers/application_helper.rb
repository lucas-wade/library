module ApplicationHelper

  def full_title(page_title = '')
    base_title = t('titles.title')
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

  def header_title(mode = '')
    base_title = t('titles.title_html')

    if mode.empty?
      "#{base_title} #{t('titles.classroom')}".html_safe
    else if mode == 'library'
      "#{base_title}  #{t('titles.library')}".html_safe
         else if mode == 'clear'
           base_title
    end
    end
    end
  end

end
