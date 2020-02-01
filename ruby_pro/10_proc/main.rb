# frozen_string_literal: true

# Procのお試し
class ProcTest
  def self.exec(block, proc_string = nil)
    block.call(proc_string || 'exec')
  end
end

# Proc.new / procは同じ意味
pr = proc do |str = 'str is nil'|
  p str
end

# callすることでProcを実行する
pr.call
pr.call('pr call test')
ProcTest.exec(pr)
ProcTest.exec(pr, 'ccc')
