class CreateDefaultSettings < ActiveRecord::Migration[5.0]
  def up
    Setting.find_or_create_by title: 'General', slug: 'general'
  end
end
