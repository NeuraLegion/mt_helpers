class SafeSet(T)
  include Synchronizable

  getter :inner

  def initialize(@inner : Set(T) = Set(T).new) forall T
    @synchronize_lock = Mutex.new(:reentrant)
  end

  macro method_missing(call)
    synchronize do
      @inner.{{call}}
    end
  end

  def safe_inner
    synchronize do
      @inner.dup
    end
  end
end
