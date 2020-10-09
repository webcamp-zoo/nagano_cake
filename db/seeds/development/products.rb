
5.times do |idx|
    Product.create(
        product_genre_id: 1,
        price: 1000,
        name: "ショートケーキ#{idx}",
        image: open('./app/assets/images/shortcake.jpg'),
        introduction: "めっちゃおいしいショートケーキです#{idx}",
        is_active: true
    )

    Product.create(
        product_genre_id: 2,
        price: 300,
        name: "ステラおばさん#{idx}",
        image: open('./app/assets/images/cookie.jpg'),
        introduction: "めっちゃおいしいです#{idx}",
        is_active: true
    )

    Product.create(
        product_genre_id: 3,
        price: 300,
        name: "チェルシー#{idx}",
        image: open('./app/assets/images/candy.jpg'),
        introduction: "めっちゃおいしいです#{idx}",
        is_active: true
    )

    Product.create(
        product_genre_id: 4,
        price: 300,
        name: "バケツプリン#{idx}",
        image: open('./app/assets/images/pudding.jpg'),
       	introduction: "めっちゃおいしいです#{idx}",
        is_active: true
    )
end

