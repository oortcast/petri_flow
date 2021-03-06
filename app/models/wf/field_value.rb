# frozen_string_literal: true

# == Schema Information
#
# Table name: wf_field_values
#
#  id            :integer          not null, primary key
#  workflow_id   :integer
#  transition_id :integer
#  form_id       :integer
#  field_id      :integer
#  value         :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  entry_id      :integer
#

module Wf
  class FieldValue < ApplicationRecord
    belongs_to :workflow, optional: true
    belongs_to :transition, optional: true
    belongs_to :form
    belongs_to :field
    belongs_to :entry

    def value_after_cast
      field.type_for_cast.cast(value)
    end
  end
end
