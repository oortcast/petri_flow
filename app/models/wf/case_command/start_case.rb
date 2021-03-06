# frozen_string_literal: true

module Wf::CaseCommand
  class StartCase
    prepend SimpleCommand
    attr_reader :wf_case
    def initialize(wf_case)
      @wf_case = wf_case
    end

    def call
      Wf::ApplicationRecord.transaction do
        wf_case.active!
        AddToken.call(wf_case, wf_case.workflow.places.start.first)
        SweepAutomaticTransitions.call(wf_case)
      end
    end
  end
end
