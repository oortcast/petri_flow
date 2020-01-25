# frozen_string_literal: true

class AddTriggerTimeForWorkitem < ActiveRecord::Migration[6.0]
  def change
    add_column :wf_workitems, :trigger_time, :datetime, comment: "trigger time for timed transition"
    add_index :wf_workitems, %i[state trigger_time]
  end
end