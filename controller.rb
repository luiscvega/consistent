layout 'layout.html.erb'

helpers do
  def link_to(url, text)
    url == "/" ? url = "/" : (url = "#{url}.html")
    "<a href=\"#{url}\">#{text}</a>"
  end
end