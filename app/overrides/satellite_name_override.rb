Deface::Override.new(:virtual_path  => "home/_topbar",
                     :name          => "remove foreman name from topbar",
                     :replace       => "erb[loud]:contains('link_to')",
                     :text          =>  "")

Deface::Override.new(:virtual_path  => "home/_topbar",
                     :name          => "add link to home",
                     :surround      => "erb[loud]:contains('image_tag')",
                     :text          => "<%= link_to main_app.root_path do%><%= render_original %><% end %>")

Deface::Override.new(:virtual_path  => "users/login",
                     :name          => "add redhat logo",
                     :insert_before => "div#login",
                     :text          => "<span id='badge'><%= image_tag('Redhat-logo.png') %></span>")

Deface::Override.new(:virtual_path  => "templates/_form",
                     :name          => "change url of provioning templates",
                     :replace       => "div.alert-success:first-child",
                     :text          =>  "<%= alert :class => 'alert-success', :header => '',
                                        :text  => icon_text(\"info-sign\", (_('Note: %s ') % link_to(_('Useful template functions and macros'),
                                         type == 'ptable' ? \"https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{SETTINGS[:version].short}/html/User_Guide/sect-Partition_Tables.html\" : \"'https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{SETTINGS[:version].short}/html/User_Guide/sect-Provisioning_Templates.html\",
                                         :rel => 'external', :id => type+\"_doc_url\")).html_safe) %>")

Deface::Override.new(:virtual_path  => "about/index",
                     :name          => "change about page content",
                     :replace       => "div.col-md-5 div.stats-well:nth-child(1)",
                     :text          =>  "    <div class=\"stats-well\"><h4><%= _(\"Support\") %></h4> <p>Visit the <%= link_to _('Customer Portal'), \"https://access.redhat.com/\",
                                       :rel => \"external\" %> to get support, find solutions to common questions, and more.</p><h6><%= _(\"Documentation\") %></h6>
                                        <ul>
                                        <li><%= link_to _('User Guide'),\"https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{SETTINGS[:version].short}/html/User_Guide/index.html\", :rel => \"external\" %></li>
                                        <li><%= link_to _('Transition Guide'),\"https://access.redhat.com/site/documentation/en-US/Red_Hat_Satellite/#{SETTINGS[:version].short}/html/Transition_Guide/index.html\", :rel => \"external\" %></li>
                                                                            <li><%= link_to _(\"API Guide\"), \"https://access.redhat.com/site/documentation/en-US/Red_Hat_Satellite/#{SETTINGS[:version].short}/html/API_Guide/index.html\", :rel => \"external\" %></li>
                                        </ul>
                                        <h6><%= _(\"Blog\") %></h6>
                                        <ul>
                                          <li><%= link_to _('Red Hat Satellite Blog'), \"https://access.redhat.com/blogs/1169563\", :rel => \"external\" %></li>
                                        </ul>
                                        <h6><%= _(\"IRC\") %></h6>
                                        <p><%= (_(\"You can find us on %{freenode} (irc.freenode.net) on #satellite6.\") % {:freenode => link_to(\"freenode\", \"http://www.freenode.net\", :rel => \"external\")}).html_safe  %></p>
                                        </div>")

Deface::Override.new(:virtual_path  => "environments/welcome",
                     :name          => "change environments help url",
                     :replace       => "p a",
                     :text          => "<a href=\"https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{SETTINGS[:version].short}/html/User_Guide/Importing_Parameterized_Classes_from_a_Puppet_Master.html\" rel=\"external\"><%= _('Puppet classes and environment importer') %></a>")

Deface::Override.new(:virtual_path  => "common/500",
                     :name          => "change 500 page content",
                     :replace       => "div:nth-child(1)",
                     :text          => "")

Deface::Override.new(:virtual_path  => "common/500",
                     :name          => "change 500 page content",
                     :replace       => "div:nth-child(2)",
                     :text          => "<div id=\"backtrace\" class=\"alert alert-block alert-danger base in fade hide\">\r\n  <em><%= exception.class %><\/em><br>\r\n  <strong><%= exception.message %><\/strong><br>\r\n
                                       <%= Rails.backtrace_cleaner.clean(exception.backtrace).join(\"<br>\").html_safe %>\r\n<\/div>")

Deface::Override.new(:virtual_path  => "common/500",
                     :name          => "change 500 page content",
                     :replace       => "p",
                     :text          => "<p>\r\n  <%= _(\"If you feel this is an error with Satellite 6 itself, please open a new issue with\") %> <%= link_to _(\"Satellite ticketing system\"), \"https:\/\/access.redhat.com\/home\",
                                       :rel => \"external\" %>,\r\n  <%= _(\"You would probably need to attach the\") %>\r\n  <%= link_to_function(_(\"Full trace\"), \"$(\'#backtrace\').toggle()\")%> <%= _(\"and relevant log entries.\") %>\r\n<\/p>")