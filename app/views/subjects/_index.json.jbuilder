json.array! @subjects do |subject|
  json.id subject.id
  json.name subject.name
  json.position subject.position
  json.visible subject.visible

  json.pages subject.pages do |page|
    json.id page.id
    json.subject_id page.subject_id
    json.name page.name
    json.position page.position
    json.visible page.visible

    json.sections page.sections do |section|
      json.id section.id
      json.page_id section.page_id
      json.name section.name
      json.content section.content
      json.position section.position
      json.visible section.visible
    end
  end
end
