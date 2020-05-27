module Synchronizable
  @synchronize_lock = Mutex.new

  protected def synchronize(lock : Mutex = @synchronize_lock)
    lock.synchronize do
      yield
    end
  end
end
