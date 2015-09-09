//= include_foreman javascripts/config_template.js

function set_fullscreen(){
    $('#main').append($("#editor1"));
    $("#editor1")
        .height($(window).height())
        .width($(window).width())
        .css('top', 0)
        .addClass('container');
    $('#content').hide();
    $('.navbar').addClass('hidden');
    $('.logo-bar').addClass('hidden');
    $editor.resize();
    $('#main').append($('.exit-fullscreen'));
    $('.exit-fullscreen').show();
    $(window).scrollTop();
}
