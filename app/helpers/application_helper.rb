module ApplicationHelper
  include RoomsHelper

  def page_title_tag
    tag.title @page_title || "Campfire"
  end

  def current_user_meta_tags
    unless Current.user.nil?
      safe_join [
        tag(:meta, name: "current-user-id", content: Current.user.id),
        tag(:meta, name: "current-user-name", content: Current.user.name),
        tag(:meta, name: "current-user-role", content: Current.user.role)
      ]
    end
  end

  def custom_styles_tag
    if custom_styles = Current.account&.custom_styles
      tag.style(custom_styles.to_s.html_safe, data: { turbo_track: "reload" })
    end
  end

  def body_classes
    [ @body_class, admin_body_class, account_logo_body_class ].compact.join(" ")
  end

  def link_back
    # Check for from= query string parameter
    if params[:from].present?
      # Use the from parameter as the back destination
      link_back_to params[:from]
    else
      # Otherwise, return to the last room visited
      link_back_to_last_room_visited
    end
  end

  def link_home
    link_back_to request.referer || "/"
  end

  def link_back_to(destination)
    link_to destination, class: "btn d-hotwire-native-none" do
      image_tag("arrow-left.svg", aria: { hidden: "true" }, size: 20) +
      tag.span("Go Back", class: "for-screen-reader")
    end
  end

  # User statistics helpers
  def user_stats_for_period(user_id, period = :all_time)
    StatsService.user_stats_for_period(user_id, period)
  end

  def user_rank_for_period(user_id, period = :all_time)
    StatsService.calculate_user_rank(user_id, period)
  end

  def format_user_stats(stats, rank, total_users)
    return "No messages" if stats.nil? || stats.message_count.to_i == 0

    message_count = number_with_delimiter(stats.message_count)
    rank_text = rank ? "#{rank.ordinalize} of #{number_with_delimiter(total_users)}" : ""

    "#{message_count} messages #{rank_text}".strip
  end

  private
    def admin_body_class
      "admin" if Current.user&.can_administer?
    end

    def account_logo_body_class
      "account-has-logo" if Current.account&.logo&.attached?
    end
end
