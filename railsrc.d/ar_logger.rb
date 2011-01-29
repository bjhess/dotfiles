# Called after the irb session is initialized and Rails has
# been loaded (props: Mike Clark).
IRB.conf[:IRB_RC] = Proc.new do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.instance_eval { alias :[] :find }
end