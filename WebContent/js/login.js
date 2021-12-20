'use strict';

$(function () {
    console.log()
    var input_area = $('.input-area input');
    var check = true;
    function checkinput() {
        return check;
    }
    input_area.on('focus', function () {
        $(this).on('keypress', e => {
            if (e.key && e.key === "Enter") {
                $('.btn:first').trigger('click');
            }
        });
    });
    function validate() {
        check = true;
        input_area.each(function () {
            if (!$(this).val() || /^\s*$/.test($(this).val())) {
                $(this).trigger('focus');
                check = false;
                return false;
            }
        });
    }
    $('#clear').on('click', function () {
        input_area.val('');
    });

});

