module ThemeLayoutHelper
  extend ActiveSupport::Concern
  def alert(opts = {})
    opts[:close]  = true if opts[:close].nil?
    opts[:class] ||= "alert-warning"
    html_class    = "alert #{opts[:class]} "
    html_class    += 'alert-dismissable' if opts[:close]
    content_tag :div, :class => html_class do
      result = "".html_safe
      result += alert_close if opts[:close]
      result += alert_header(opts[:header])
      result += "#{opts[:text]}".html_safe
      result
    end
  end
end