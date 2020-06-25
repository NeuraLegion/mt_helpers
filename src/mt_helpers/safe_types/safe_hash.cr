class SafeHash(K, V)
  include Synchronizable

  getter :inner

  def initialize(@inner : Hash(K, V) = Hash(K, V).new) forall K, V
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
