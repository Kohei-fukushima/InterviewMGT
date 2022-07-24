# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#タグの種類を生成
Tag.create([
    { name: '社内会議' },
    { name: '社内面談' },
    { name: '評価面談'},
    { name: '学習記録'},
    ])
Admin.create!(
    email: "interview@admin",
    password: "interview"
    )

#あとで修正項目
# tags = %w(社内会議 社内面談 評価面談 学習記録 )
# tags.each do |tag|
#   Tag.find_or_create_by(name: tag)
# end