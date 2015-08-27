class Cart
  attr_reader :data

  def initialize(data)
    @data = data || {}
  end

  def jobs
    @data.map do |job_id|
      job = Job.find(job_id[0])
      CartJob.new(job)
    end
  end

  def add_job(job)
    data[job.id.to_s] ||= 0
    data[job.id.to_s] += 1
  end

  def remove_job(job)
    data.except!(job.id.to_s)
  end

  def total
    jobs.size
  end
end
