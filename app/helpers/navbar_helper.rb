module NavbarHelper
  def admin_nav_items
    [
      ['Users', admin_users_path],
      ['Teams', admin_teams_path],
      ['Events', admin_events_path],
      ['Blogs', admin_blogs_path],
      ['Dashboard', admin_root_path]
    ]
  end

  def user_nav_items
    [
      ['Contact', events_path],
      ['Blogs', blogs_path],
      ['Events', events_path],
      ['Teams', teams_path],
      ['Leaderboard', leaderboard_index_path]
    ]
  end
end
