# frozen_string_literal: true

require "rails/generators/active_record/migration/migration_generator"
class Plugin::MigrationGenerator < ActiveRecord::Generators::MigrationGenerator
  desc "Expecting NAME to start with name of plugin: Pluginname_Migrationname"
  source_root "#{Gem.loaded_specs["activerecord"].full_gem_path}/lib/rails/generators/active_record/migration/templates"
  private

  def db_migrate_path
    plugin_folder = 'plugins/' + name.split("_").first
    plugin_folder = plugin_folder.underscore.dasherize
    unless File.directory?(Rails.root.join(plugin_folder))
     print "#{plugin_folder} does not exit. Expecting NAME to start with name of plugin: Pluginname_Migrationname"
     exit
    end
    plugin_folder + "/db/migrate"
  end
end
