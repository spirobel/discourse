# frozen_string_literal: true

require "rails/generators/active_record/migration/migration_generator"

class Plugin::MigrationGenerator < ActiveRecord::Generators::MigrationGenerator
  desc "Expecting migration NAME to start with name of plugin: PLUGINFOLDER_migration_name"
  source_root "#{Gem.loaded_specs["activerecord"].full_gem_path}/lib/rails/generators/active_record/migration/templates"
  private

  def db_migrate_path
    plugin_folder = 'plugins/' + name.split("_").first
    unless File.directory?(Rails.root.join(plugin_folder))
     print "#{plugin_folder} does not exit. Expecting migration NAME to start with name of plugin: PLUGINFOLDER_migration_name"
     exit
    end
    plugin_folder + "/db/migrate"
  end
end
