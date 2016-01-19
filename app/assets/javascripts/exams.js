// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

'use strict';
$(document).ready(function () {
    $('button[data-action="next-tab"]').click(function (e) {
        e.preventDefault();
        var id = $(this).parents('.tab-pane').next().attr('id');
        $('a[aria-controls="' + id + '"').tab('show');
    });
});