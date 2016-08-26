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

Deface::Override.new(:virtual_path  => "users/extlogout",
                     :name          => "change version for the external logout page",
                     # p#version
                     :replace       => "div.details p:last",
                     :text          => '<p><%= _("Version %{version}") % {:version => ForemanThemeSatellite::SATELLITE_VERSION} %></p>')

Deface::Override.new(:virtual_path  => "users/login",
                     :name          => "change version for login page",
                     # p#version
                     :replace       => "div.details p:last",
                     :text          => '<p><%= _("Version %{version}") % {:version => ForemanThemeSatellite::SATELLITE_VERSION} %></p>')

Deface::Override.new(:virtual_path  => "users/login",
                     :name          => "change welcome message for login page",
                     # p#welcome
                     :replace       => "div.details p:first",
                     :text          => '<p><%= _("Welcome to Satellite")%></p>')

Deface::Override.new(:virtual_path  => "about/index",
                     :name          => "change about page content",
                     # div#support
                     :replace       => "div.col-md-5 div.stats-well:nth-child(1)",
                     :text          =>  "    <div class=\"stats-well\"><h4><%= _(\"Support\") %></h4> <p>Visit the <%= link_to _('Customer Portal'), \"https://access.redhat.com/\",
                                       :rel => \"external\" %> to get support, find solutions to common questions, and more.</p><h6><%= _(\"Documentation\") %></h6>
                                        <ul>
                                        <li><%= link_to _('User Guide'),\"https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/index.html\", :rel => \"external\" %></li>
                                        <li><%= link_to _('Transition Guide'),\"https://access.redhat.com/site/documentation/en-US/Red_Hat_Satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/Transition_Guide/index.html\", :rel => \"external\" %></li>
                                                                            <li><%= link_to _(\"API Guide\"), \"https://access.redhat.com/site/documentation/en-US/Red_Hat_Satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/API_Guide/index.html\", :rel => \"external\" %></li>
                                        </ul>
                                        <h6><%= _(\"Blog\") %></h6>
                                        <ul>
                                          <li><%= link_to _('Red Hat Satellite Blog'), \"https://access.redhat.com/blogs/1169563\", :rel => \"external\" %></li>
                                        </ul>
                                        <h6><%= _(\"IRC\") %></h6>
                                        <p><%= (_(\"You can find us on %{freenode} (irc.freenode.net) on #satellite6.\") % {:freenode => link_to(\"freenode\", \"http://www.freenode.net\", :rel => \"external\")}).html_safe  %></p>
                                        </div>")

Deface::Override.new(:virtual_path  => "about/index",
                     :name          => "add satellite version for about page",
                     :insert_before => "p#copyright-p",
                     :text          => '<p id="sat-copyright-p">Red Hat Satellite<br/><%= (_("Version %{version} © %{year} Red Hat Inc.") % {:version => ForemanThemeSatellite::SATELLITE_SHORT_VERSION, :year=>DateTime.now.year}).html_safe %></p>')

Deface::Override.new(:virtual_path  => "about/index",
                     :name          => "change version text for about page",
                     :replace       => "p#copyright-p",
                     :text          => '<p id="copyright-p"><%= (_("Includes %{system} © 2009-%{year} Paul Kelly and Ohad Levy") % {:system => "Foreman", :year => DateTime.now.year}).html_safe %></p>')

Deface::Override.new(:virtual_path  => "about/index",
                     :name          => "remove links to upstream plugins",
                     :replace       => "#plugins table tbody tr td:first-of-type",
                     :text          => '<td><%= plugin.name %></td>')

Deface::Override.new(:virtual_path  => "common/500",
                     :name          => "change 500 page content",
                     # p#message
                     :replace       => "p",
                     :text          => "<p>\r\n  <%= _(\"If you feel this is an error with Satellite 6 itself, please open a new issue with\") %> <%= link_to _(\"Satellite ticketing system\"), \"https:\/\/access.redhat.com\/home\",
                                       :rel => \"external\" %>,\r\n  <%= _(\"You would probably need to attach the\") %>\r\n  <%= link_to_function(_(\"Full trace\"), \"$(\'#backtrace\').toggle()\")%> <%= _(\"and relevant log entries.\") %>\r\n<\/p>")
