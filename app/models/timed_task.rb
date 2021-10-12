class TimedTask < Task
  validates_presence_of :ends_at

  before_update :completed?
  before_update :ensure_starts_at

  def completed?
    self.completed = Timze.zone.now > (ends_at || 1.day.from_now)
  end

  def ensure_starts_at
    self.starts_at = Time.zone.now unless persisted? && starts_at.blank?
  end
end