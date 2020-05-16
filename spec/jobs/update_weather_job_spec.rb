require 'rails_helper'

RSpec.describe UpdateWeatherJob, type: :job do
  describe "#perform_later" do
    ActiveJob::Base.queue_adapter = :test
    let(:job) { described_class.set(wait: 10.seconds).perform_later('London') }

    it "queues the job" do
      expect { job }
        .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it "runs the queue" do
      ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
      expect { described_class.perform_later('London') }
        .to have_performed_job(described_class)
    end
  end
end
