module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  # rubocop:disable LineLength
  def my_friends(user_id)
    Friendship.where('sender_id = ? AND status = ?', user_id, true).or(Friendship.where('receiver_id = ? AND status = ?', user_id, true)).count
  end
  # rubocop:enable LineLength

  def pending(user)
    @count = 0
    user.receiving_requests.each do |cases|
      @count += 1 if cases.status.nil?
    end
    @count
  end
end
