lambda{

  namespaces = {}
  global_tasks = {}
  namespaces[:global] = global_tasks
  current_tasks = global_tasks

  Kernel.send :define_method, :task do|name, &block|
    current_tasks[name] = block
  end

  Kernel.send :define_method, :namespace do |name, &block|
    temp = current_tasks
    current_tasks = {}
    namespaces[name] = current_tasks
    block.call
    current_tasks = temp
  end

  Kernel.send(:define_method, :run){|name|
    ns_tasks = name.split(/:/)
    if(ns_tasks.length == 2)
      namespaces[ns_tasks[0].to_sym][ns_tasks[1].to_sym].call
    else
       namespaces[:global][ns_tasks[0].to_sym].call
    end
    #tasks[name].call
  }


}.call


Dir.glob("*Makefile") do |file|
  load file
  run "hello"
  run "make"
  run "demo:hello"
end



