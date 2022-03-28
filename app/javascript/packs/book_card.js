import $ from 'jquery'
import 'select2'

function init_select2(selector) {
    $(selector).select2({
        placeholder: "Select",
    });
};

$(document).on('turbolinks:load', function() {
    init_select2(".myoption")
    $(document).on("click", ".add-book-card", function(e) {
        init_select2(".myoption");
    });
});
