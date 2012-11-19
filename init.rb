require 'redmine'

require_dependency 'auto_watchers/hooks/auto_watchers_issue_hook'

Redmine::Plugin.register :redmine_auto_watchers do
  name 'Redmine Auto Watchers Plugin'
  author 'Benjamin Kaiser'
  description 'This plugin will add everybody as watcher who gets in touch with an issue.'
  version '1.0.1'
  url 'https://github.com/dryas/redmine_auto_watchers'
  author_url 'https://github.com/dryas'
  requires_redmine :version_or_higher => '2.0.0'

  settings :default => {
        'enable_auto_watchers' => 'on'
      }, :partial => 'settings/auto_watchers'
end
