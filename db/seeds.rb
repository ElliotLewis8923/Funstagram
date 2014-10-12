# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create(:caption => 'test', :image => fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png'))
Post.create(:caption => 'test', :image => fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png'))
Post.create(:caption => 'test', :image => fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png'))
Post.create(:caption => 'test', :image => fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png'))
Post.create(:caption => 'test', :image => fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png'))
Post.create(:caption => 'test', :image => fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png'))
Post.create(:caption => 'test', :image => fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png'))