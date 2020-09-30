class ProductGenre < ApplicationRecord
	  enum name: { ケーキ: 0, プリン: 1, 焼き菓子: 2, キャンディ: 3 }
end