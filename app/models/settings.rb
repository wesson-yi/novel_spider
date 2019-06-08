class Settings < Settingslogic
  source "#{Rails.root}/config/settings.yml" # rubocop:disable Rails/FilePath
  namespace Rails.env
end
