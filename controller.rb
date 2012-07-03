layout 'layout.html.erb'

helpers do
  def link_to(url, text)
    "<a href=\"#{url}.html\">#{text}</a>"
  end
end