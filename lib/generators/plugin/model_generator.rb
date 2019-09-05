# frozen_string_literal: true

require "rails/generators/active_record/model/model_generator"

class Plugin::ModelGenerator < ActiveRecord::Generators::ModelGenerator
  desc "Expecting NAME to start with name of plugin: PluginNameModelName"
  source_root "#{Gem.loaded_specs["activerecord"].full_gem_path}/lib/rails/generators/active_record/model/templates"

  def create_model_file
    template "model.rb", File.join(db_migrate_path[0...-10],"app/models", class_path, "#{file_name}.rb")
  end

  def create_module_file
    return if regular_class_path.empty?
    template "module.rb", File.join(db_migrate_path[0...-10],"app/models", "#{class_path.join('/')}.rb") if behavior == :invoke
  end


  private

  def db_migrate_path
    plugin_folder = 'plugins/' + name.underscore.split("_").first
    unless File.directory?(Rails.root.join(plugin_folder))
     print "#{plugin_folder} does not exit. Expecting NAME to start with name of plugin: PluginNameModelName"
     exit
    end
    plugin_folder + "/db/migrate"
  end


end
