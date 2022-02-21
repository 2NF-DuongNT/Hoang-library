$ = require('jquery');
select2 = require('select2')($);
$(document).ready(function() {
    $('.select_book').select2({
        placeholder: "Select a book",
        allowClear: true
    });
});