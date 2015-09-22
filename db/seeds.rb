# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Subject.create!(name: 'Test One', visible: true)
Subject.create!(name: 'Test Two', visible: true)
Subject.create!(name: 'Test Three', visible: true)

Page.create!(subject_id: 1, name: 'Test Page One')
Page.create!(subject_id: 1, name: 'Test Page Two')
Page.create!(subject_id: 1, name: 'Test Page Three')
Page.create!(subject_id: 2, name: 'Test Page One')
Page.create!(subject_id: 2, name: 'Test Page Two')
Page.create!(subject_id: 2, name: 'Test Page Three')
Page.create!(subject_id: 3, name: 'Test Page One')
Page.create!(subject_id: 3, name: 'Test Page Two')
Page.create!(subject_id: 3, name: 'Test Page Three')

Section.create!(page_id: 1, name: 'Test Section One')
Section.create!(page_id: 1, name: 'Test Section Two')
Section.create!(page_id: 2, name: 'Test Section One')
Section.create!(page_id: 2, name: 'Test Section Two')
Section.create!(page_id: 3, name: 'Test Section One')
Section.create!(page_id: 3, name: 'Test Section Two')
Section.create!(page_id: 4, name: 'Test Section One')
Section.create!(page_id: 4, name: 'Test Section Two')
Section.create!(page_id: 5, name: 'Test Section One')
Section.create!(page_id: 5, name: 'Test Section Two')
Section.create!(page_id: 6, name: 'Test Section One')
Section.create!(page_id: 6, name: 'Test Section Two')
Section.create!(page_id: 7, name: 'Test Section One')
Section.create!(page_id: 7, name: 'Test Section Two')
Section.create!(page_id: 8, name: 'Test Section One')
Section.create!(page_id: 8, name: 'Test Section Two')
Section.create!(page_id: 9, name: 'Test Section One')
Section.create!(page_id: 9, name: 'Test Section Two')
