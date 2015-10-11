module ThemeLayoutHelper
  extend ActiveSupport::Concern
  def alert(opts = {})
    opts[:close]  = true if opts[:close].nil?
    opts[:header] ||= _("Warning!")
    opts[:text]   ||= _("zibi")
    opts[:class] ||= "alert-warning"
    html_class    = "alert #{opts[:class]} "
    html_class    += 'alert-dismissable' if opts[:close]
    content_tag :div, :class => html_class, :id => opts[:id] do
      result = "".html_safe
      result += alert_close if opts[:close]
      result += alert_header(opts[:header])
      result += content_tag(:span, opts[:text].html_safe, :class => 'text')
      result
    end
  end
end