module ApplicationHelper
  def active_if(path)
    path == controller_path ? 'active' : ''
  end
end
