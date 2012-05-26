module ApplicationHelper
  #get the path from url
  def img_assets_path(url)
    u=url.rpartition('/')
    return u[0]
  end
end
