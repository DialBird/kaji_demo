# frozen_string_literal: true

module LabelHelper
  def gender_label(gender)
    case gender
    when Gender::MAN
      content_tag :span, class: 'label label-primary' do
        concat content_tag :i, '', class: 'fa fa-mars'
      end
    when Gender::WOMAN
      content_tag :span, class: 'label label-danger' do
        concat content_tag :i, '', class: 'fa fa-venus'
      end
    when Gender::OTHER
      content_tag :span, class: 'label label-success' do
        concat content_tag :i, '', class: 'fa fa-transgender'
      end
    end
  end
end
