# frozen_string_literal: true

module ApplicationHelper
  def page_title(title)
    content_for(:title) { title.to_s }
  end

  def page_meta_description(meta_description)
    content_for(:meta_description) { meta_description.to_s }
  end

  def yield_or_default(section, default = '')
    content_for?(section) ? content_for(section) : default
  end

  def page_entries_info(collection)
    model_name = collection.respond_to?(:human_name) ? collection.model_name.human : (collection.first&.model_name&.human || '')

    sanitize "Displaying #{model_name} " +
      tag.b("#{collection.offset + 1} - #{[collection.per_page * collection.current_page, collection.total_entries].min}") +
      ' of ' + tag.b(collection.total_entries) +
      ' in total'
    end
end
