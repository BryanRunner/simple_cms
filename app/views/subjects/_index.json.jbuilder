json.array! @subjects do |subject|
  json.id subject.id
  json.name subject.name
  json.position subject.position
  json.visible subject.visible

  json.pages subject.pages do |page|
    json.id page.id
    json.name page.name
    json.position page.position
    json.visible page.visible
  end
end
