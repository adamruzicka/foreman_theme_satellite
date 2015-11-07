//= include_foreman javascripts/dashboard.js

function start_gridster(){
    var gridster = $(".gridster>ul").gridster({
        widget_margins: [10, 10],
        widget_base_dimensions: [82, 340],
        max_size_x: 12,
        min_cols: 12,
        max_cols: 12,
        autogenerate_stylesheet: false
    }).data('gridster');
    gridster.cols = 12;
    gridster.for_each_widget_below(13, 0, function(){
        gridster.remove_from_gridmap(this);
        gridster.register_widget(this)});

    $(".gridster>ul>li[data-hide='true']").each(function(i, widget) {
        $(widget).hide();
        gridster.remove_widget(widget);
        $(".gridster>ul").append($(widget));
    });
    fill_restore_list();
}