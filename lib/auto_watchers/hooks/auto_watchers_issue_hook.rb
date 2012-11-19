class AutoWatchersHook < Redmine::Hook::ViewListener
  def controller_issues_edit_before_save(context={ })
    configuration = Setting.plugin_redmine_auto_watchers
    if configuration['enable_watchers']
      @issue = context[:issue]
      unless @issue.watched_by?(User.current) || @issue.author == User.current
        @issue.add_watcher(User.current)
      end
      unless @issue.assigned_to == nil || (not @issue.assigned_to === User) || @issue.watched_by?(@issue.assigned_to) || @issue.author == @issue.assigned_to
        @issue.add_watcher(@issue.assigned_to)
      end
    end
  end
end
