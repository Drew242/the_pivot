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

  def decrease_item(item)
    if data[item.id.to_s] && data[item.id.to_s] > 1
      data[item.id.to_s] -= 1
    else
      data.except!(item.id.to_s)
    end
  end

  def remove_job(job)
    data.except!(job.id.to_s)
  end

  def total
    jobs.size
    # jobs.inject(0) do |subtotal, cart_job|
    #
    #   # subtotal + (cart_job.final_price * cart_job.quantity)
    #   subtotal += 1
    # end

  end
end
