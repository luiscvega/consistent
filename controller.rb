layout 'layout.html.erb'

helpers do
  def link_to(url, text)
    "<a href=\"#{url}\">#{text}</a>"
  end
end