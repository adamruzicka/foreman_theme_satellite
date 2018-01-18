Deface::Override.new(:virtual_path   => "users/login",
                     :name           => "satellite logo login",
                     :replace        => "erb[loud]:contains('login_logo.png')",
                     :text           => '<%= image_tag("login_logo.svg") %>')

Deface::Override.new(:virtual_path     => "users/login",
                     :name             => "add redhat logo",
                     :replace_contents => "span#badge",
                     :text             => "<%= image_tag('Redhat-logo.png') %>")

Deface::Override.new(:virtual_path   => "users/extlogout",
                     :name           => "satellite logo logout",
                     :replace        => "erb[loud]:contains('login_logo.png')",
                     :text           => '<%= image_tag("login_logo.svg") %>')
