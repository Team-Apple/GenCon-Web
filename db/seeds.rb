# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Event.delete_all

base_a = %w[彼女 友達 家族]
base_b = %w[出かける 旅行 パーティ 焼肉 ディズニー 温泉 お泊まり会 ライブ 体験入学 学校見学 海 スキー スノボ DJ]

(0..31).to_a.each do |i|
  p Event.create(
    title: "#{base_a.sample}と#{base_b.sample}",
    priority: [0, 1, 2].sample,
    start_at_date: Date.current + i.days,
    start_at_time: Time.current + i.hours,
    end_at_date: Date.current + (i + rand(3)).days,
    end_at_time: Time.current + (i + rand(3) + 1).hours,
    memo: '楽しみだなあ'
  )
end

puts 'events seeded.'

Task.delete_all

base = %w[レポート 課題 ポスター制作 納品 PCメンテナンス 掃除 洗濯 皿洗い]

(0..31).to_a.each do |i|
  p Task.create(
    title: base.sample,
    priority: [0, 1, 2].sample,
    start_from_date: Date.current + i.days,
    start_from_time: Time.current + i.hours,
    deadline_date: Date.current + (i + rand(3)).days,
    deadline_time: Time.current + (i + rand(3) + 1).hours,
    memo: 'やらなきゃなあ'
  )
end

puts 'tasks seeded.'
