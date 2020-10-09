
names = %w(ケーキ 焼き菓子 キャンディ プリン)

4.times do |idx|
    ProductGenre.create(
        name: names[idx],
        is_active: true
    )
end