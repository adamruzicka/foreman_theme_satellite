//= include /home/agoldboi/git/foreman/app/assets/javascripts/application.js

function mark_params_override(){
    $('#inherited_parameters .override-param').removeClass('override-param');
    $('#inherited_parameters span').show();
    $('#inherited_parameters a').show();
    $('#parameters').find('[id$=_name]:visible').each(function(){
        var param_name = $(this);
        $('#inherited_parameters').find('[id^=name_]').each(function(){
            if (param_name.val() == $(this).text()){
                $(this).addClass('override-param');
                $(this).closest('tr').find('textarea').addClass('override-param')
                $(this).closest('tr').find('[data-tag=override]').hide();
            }
        })
    })
    $('#inherited_puppetclasses_parameters .override-param').removeClass('override-param');
    $('#inherited_puppetclasses_parameters [data-tag=override]').show();
    $('#puppetclasses_parameters').find('[data-property=class]:visible').each(function(){
        var klass = $(this).val();
        var name = $(this).siblings('[data-property=name]').val();
        $('#inherited_puppetclasses_parameters [id^="puppetclass_"][id*="_params\\["][id$="\\]"]').each(function(){
            var param = $(this);
            if (param.find('[data-property=class]').text() == klass && param.find('[data-property=name]').text() == name) {
                param.find('.error').removeClass('error');
                param.find('.warning').removeClass('warning');
                param.addClass('override-param');
                param.find('input, textarea').addClass('override-param');
                param.find('[data-tag=override]').hide();
            }
        });
    });
    $('#params-tab').removeClass("tab-error");
    if ($("#params").find('.form-group.error').length > 0) $('#params-tab').addClass('tab-error');
    $('a[rel="popover"]').popover({html: true});
}