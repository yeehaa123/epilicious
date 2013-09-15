module Epilicious
  class Parser

    def parse_recipes_page(page)
      page.css('#artInner .recipe_result_right a').map {|link| link ['href'] }
    end

    def parse_recipe_page(page)
      recipe = {}
      recipe[:name] = page.css("div#headline h1").text 
      recipe
    end
  end
end
