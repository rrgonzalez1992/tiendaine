xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
xml.channel do
xml.title @page_title
xml.link(url_for(:action => "index", :only_path => false))
xml.language "en-us"
xml.ttl "40"
xml.description "FuriousPC: tu tienda informática"
for item in @items
xml.item do
xml.title(item.name)
xml.description("#{item.name} by #{item.provider_names}")
xml.pubDate(item.created_at.to_s(:long))
xml.guid(url_for(:action => "show", :id => item, :only_path => false))
xml.link(url_for(:action => "show", :id => item, :only_path => false))
end
end
end
end