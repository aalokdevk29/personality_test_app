// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets

$(document).on('turbolinks:load', function() {
  clickOption();
  submitQuestion();
});

function clickOption(){
  $(".question-option").click(function(e) {
    $(".question-option").css('background-color', 'white');

    question_id = $(this).data("question-id");
    option_id = $(this).data("option-id");
    $(this).css('background-color', 'darkgray');

    $('.submit').attr('data-question-id', question_id);
    $('.submit').attr('data-option-id', option_id);
    $('.submit').removeClass("disabled");
  });
}

function submitQuestion(){
  $(".submit").click(function(e) {
    question_id = $(this).data("question-id");
    option_id = $(this).data("option-id");

    $.ajax({
      url: "/question_attempt",
      method: "get",
      data: { question_id: question_id, option_id: option_id },
      success: function(response){
        $('.question-section').html(response)
        clickOption();
        submitQuestion();
      }
    });
  });
}
