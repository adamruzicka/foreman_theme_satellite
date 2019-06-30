Deface::Override.new(:virtual_path   => "users/extlogout",
                     :name           => "satellite logo logout",
                     :replace        => "erb[loud]:contains('login_logo.png')",
                     :text           => '<%= image_tag("login_logo.svg") %>')
