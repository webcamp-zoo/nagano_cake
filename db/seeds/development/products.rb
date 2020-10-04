
10.times do |idx|
    Product.create(
        genre_id: 0,
        price: 1000,
        name: "ショートケーキ#{idx}",
        image_id: "shortcake.jpg",
        introduction: "めっちゃおいしいショートケーキです#{idx}",
        is_active: true
    )
end
