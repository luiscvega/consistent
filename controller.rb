require 'yaml'
require 'sass'

helpers do
  def link_to(url, text)
    "<a href=\"#{url}.html\">#{text}</a>"
  end
end

ignore 'meat.html.erb', 'meats.yml', 'helpers.rb', '.rvmrc', '.git'
layout 'layout.html.erb'
layout 'meat.html.erb' => 'layout.html.erb'

pages = ["about", "contact", "team"]

pages.each do |page|
  layout "#{page}.html.erb" => 'pages.html.erb'
end

def generate(meat)
  name = meat["name"]
  header = meat["header"]
  variants = meat["variants"]
  
  before "#{name.downcase}.html.erb" do
    instead render 'meat.html.erb', 
      locals: {
        meat: name,
        header: header,
        variants: variants
      }
  end
end

meats = YAML::load(File.open('meats.yml'))

meats.each do |meat|
  generate meat
end