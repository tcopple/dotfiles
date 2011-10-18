require 'rubygems'

IRB.conf[:AUTO_INDENT]=true
begin; require 'irb/completion'; end;
begin; require 'pp'; end;
begin; require 'interactive_editor'; end;
begin; require 'hirb'; Hirb.enable; end;
begin; require 'what_methods'; end;

begin
  require 'logger'
  require 'active_record'

  ActiveRecord::Base.logger = Logger.new(STDOUT)
end
