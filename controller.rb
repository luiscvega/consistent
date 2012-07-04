require 'yaml'

helpers do
  def link_to(url, text)
    "<a href=\"#{url}.html\">#{text}</a>"
  end
end

ignore 'meat.html.erb'
layout 'layout.html.erb'
layout 'meat.html.erb' => 'layout.html.erb'

def generate(name, variants)
  before "#{name.downcase}.html.erb" do
    instead render 'meat.html.erb', 
      locals: {
        meat: name,
        variants: variants
      }
  end
end

meats = YAML::load(File.open('meats.yml'))

meats.each do |meat, variants|
  generate meat, variants
end

# generate "Pork",
  # [
  #   { 
  #     name: "Tenderloin",
  #     img: "http://placehold.it/300x150",
  #     description: "Rib-Eye is delicious."
  #   }, 
  #   { 
  #     name: "Rib-Eye",
  #     img: "http://placehold.it/300x150",
  #     description: "Rib-Eye is delicious."
  #   },
  # ]