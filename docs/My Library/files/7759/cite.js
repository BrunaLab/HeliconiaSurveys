$('.citation-popup').dialog({
    autoOpen: false,
    minWidth: 400,
    closeText: 'X'
});

$('.show-citation-button').click(function () {
    let buttonStyleName = $(this).data('styleName');

    $('.citation-popup').each(function () {
        let popup = $(this);
        if (popup.data('styleName') === buttonStyleName) {
            popup.dialog('open');
        } else {
            popup.dialog('close');
        }
    });
});
