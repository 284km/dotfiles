alias :r :require

def r(name)
  require name.to_s
end

def rr
  require "active_support/all"
end

begin
  require "awesome_print"

  def pbcopy(str, opts = {})
    IO.popen(clipboard, 'r+') { |io| io.print str }
  end

  def clipboard
    if RUBY_PLATFORM.match(/darwin/)
      "pbcopy"
    else
      "xsel --clipboard --input"
    end
  end

  Pry.config.commands.command "copy", "Copy last evaluated object to clipboard" do
    pbcopy _pry_.last_result.ai(:plain => true, :indent => 2, :index => false)
    output.puts "Copied!"
  end

  Pry.config.prompt = [
    proc {|target_self, nest_level, pry|
      nested = (nest_level.zero?) ? '' : ":#{nest_level}"
      "[#{pry.input_array.size}] #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}(#{Pry.view_clip(target_self)})#{nested}> "
    },
    proc {|target_self, nest_level, pry|
      nested = (nest_level.zero?) ?  '' : ":#{nest_level}"
      "[#{pry.input_array.size}] #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}(#{Pry.view_clip(target_self)})#{nested}* "
    }
  ]

  Pry.config.commands.alias_command "fm", "find-method"
  Pry.config.commands.alias_command "l", ".ls -al"
  Pry.config.commands.alias_command ":q", "exit"
  Pry.config.commands.alias_command "sd", "show-doc"
  Pry.config.commands.alias_command "ss", "show-source -l"
  Pry.config.commands.alias_command "sm", "show-method -l"
  # Pry.config.commands.alias_command "em", "edit-method"

  if defined?(PryDebugger)
    Pry.commands.alias_command 'c', 'continue'
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'f', 'finish'
  end

  if defined?(PryByebug)
    Pry.commands.alias_command 'c', 'continue'
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'f', 'finish'
  end

rescue Exception
end
