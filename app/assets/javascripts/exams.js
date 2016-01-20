// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

'use strict';
$(document).on('ready page:load', function () {
    $('a.next-tab').click(function (e) {
        e.preventDefault();
        var id = $(this).parents('.tab-pane').next().attr('id');
        $('a[aria-controls="' + id + '"').tab('show');
    });

});