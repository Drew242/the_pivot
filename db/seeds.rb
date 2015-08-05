Category.create(name: "hats")
Category.create(name: "tops")
Category.create(name: "accessories")

Item.create(category_id: 2, title: "Parka",
description: "Stay warm in the tundra",
price: 3000,
image: "http://www.wired.co.uk/_/img/jurassic/labcoat.png")

Item.create(category_id: 1, title: "Cowboy",
description: "Yee-haw",
price: 5000,
image: "https://s-media-cache-ak0.pinimg.com/736x/b9/94/1f/b9941fda16dad603a2739186e163267e.jpg")

Item.create(category_id: 1, title: "Top Hat",
description: "Like a sir",
price: 10000,
image: "https://s-media-cache-ak0.pinimg.com/236x/de/d0/69/ded069fd1c4252b2bdf0ccca4f9d5214.jpg")

Item.create(category_id: 2, title: "Sweater",
description: "Brrrr",
price: 10000,
image: "http://pre02.deviantart.net/98a1/th/pre/f/2012/049/e/b/dinosaurs_in_vests_by_ptchew-d4q7tnv.jpg")

Item.create(category_id: 3, title: "Bow",
description: "Awwww",
price: 200,
image: "http://www.vogue.co.uk/_/media/prehistoric-trends/prehistoric_trends.png")
