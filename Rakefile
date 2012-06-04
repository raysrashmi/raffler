  $:.unshift("/Library/RubyMotion/lib")
  require 'motion/project'
  require 'rubygems'
  require 'motion-cocoapods'
  require 'nano-store'


  Motion::Project::App.setup do |app|
    # Use `rake config' to see complete project settings.
    app.files += Dir.glob(File.join(app.project_dir, 'lib/nanostore.rb'))
    app.name = 'raffler'
      app.pods do
        dependency 'NanoStore', '~> 2.0.1'
      end
  end
