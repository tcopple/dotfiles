require 'rubygems'

IRB.conf[:AUTO_INDENT]=true
begin; require 'pp'; end;
begin; require 'irb/completion'; end;
begin; require 'interactive_editor'; end;
begin; require 'hirb'; Hirb.enable; end;
begin; require 'what_methods'; end;

begin
  require 'logger'
  require 'active_record'

  logger = Logger.new(STDOUT)
  logger.formatter = proc do |serverity, datetime, progname, msg|
    "[#{datetime.strftime("%Y%m%d %H%M%S")}]: #{msg}\n"
  end

  ActiveRecord::Base.logger = logger
end
