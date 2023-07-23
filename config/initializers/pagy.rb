Pagy::DEFAULT[:items] = 15
Pagy::DEFAULT[:size]  = [1, 4, 4, 1]
require 'pagy/extras/overflow'
Pagy::DEFAULT[:overflow] = :last_page
