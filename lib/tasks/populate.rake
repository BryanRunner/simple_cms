namespace :populate do

  desc "Creates sample subject data"
    task :subjects, [:subject] => :environment do |t, args|
      subject = args.subject.to_i
      subject.times do |n|
        n = n+1
        createSubjects(n, subject)
      end
    end

  desc "Creates sample page data"
    task :pages, [:subjects, :pages] => :environment do |t, args|
      subjects = args.subjects.to_i
      pages = args.pages.to_i
      subjects.times do |n|
        subject = n+1
        pages.times do |n|
          n = n+1
          createPages(n, subject)
        end
      end
    end

  desc "Creates sample section data"
    task :sections, [:pages, :sections] => :environment do |t, args|
      pages = args.pages.to_i
      sections = args.sections.to_i
      pages.times do |n|
        page = n+1
        sections.times do |n|
          n = n+1
          createSections(n, page)
        end
      end
    end

  def createSubjects(n, subject)
    subject = Faker::App.name
    puts "Creating Subject #{n} of #{subject}"
    Subject.create!( name: subject )
  end

  def createPages(n, subject)
    name = Faker::Hacker.noun
    puts "Creating Page #{n} of 5 for subject #{subject}"
    Page.create!( name: name, subject_id: subject )
  end

  def createSections(n, page)
    name = Faker::Hacker.ingverb
    content = Faker::Lorem.paragraph(4)
    puts "Creating Section #{n} of 5 for page #{page}"
    Section.create!( name: name, page_id: page, content: content )
  end
end
