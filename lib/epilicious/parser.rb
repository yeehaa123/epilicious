module Epilicious
  class Parser

    def parse_recipes_page(page)
      page.css('#artInner .recipe_result_right a').map {|link| link ['href'] }
    end

    def parse_recipe_page(page)
      recipe = {}
      recipe[:name]        = name(page) 
      recipe[:servings]    = servings(page) 
      recipe[:ingredients] = ingredients(page) 
      recipe[:instructions] = instructions(page) 
      recipe
    end

    private
    
    def name(page)
      page.css("div#headline h1").text 
    end

    def servings(page)
      page.css("div#recipe_summary p span").first.text 
    end

    def ingredients(page)
      ingredients_list = page.css("ul.ingredientsList li")
      ingredients_list.map {|li| li.text}
    end

    def instructions(page)
      preparation = page.css("div#preparation.instructions p")
      preparation.map {|i| i.text.strip.gsub("\n", ' ').squeeze(' ')}
    end
  end
end
