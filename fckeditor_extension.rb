# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class FckeditorExtension < Radiant::Extension
  version "0.5"
  description "Adds the FCKEditor editor - with file uploads and spell checking."
  url "http://github.com/djcp/radiant-fckeditor/tree/master"

  define_routes do |map|
    map.connect 'fckeditor/:action', :controller => '/fckeditor'
    map.connect 'fckeditor/check_spelling', :controller => '/fckeditor', :action => 'check_spelling'
    map.connect 'fckeditor/command', :controller => '/fckeditor', :action => 'command'
    map.connect 'fckeditor/upload', :controller => '/fckeditor', :action => 'upload'
  end
  
  def activate
    FckeditorFilter
    Admin::PagesController.send :include, FckeditorInterface
    admin.page.edit.add :part_controls, "editor_control"
  end
  
  def deactivate
  end
end
