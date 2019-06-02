function updateTaskCounter(incrementOrDecrement) {
  currentValue = parseInt($('.task-active-counter').html());
  if (incrementOrDecrement === 'increment') {
    $('.task-active-counter').html(currentValue + 1);
  } else {
    $('.task-active-counter').html(currentValue - 1);
  }
}

function onLoadEvents() {
  // complete task
  $('.task-name').click(function() {
    var $_this = $(this);
    $.ajax({
      context: $(this),
      method: "PUT",
      headers: { 'X-CSRF-Token': Rails.csrfToken() },
      url: '/tasks/' + $(this).attr('data-value'),
      data: { task: { completed_at: $.now() } }
    })
      .done(function() {
        var $taskItem = $(this).parent('.task-item');

        if ($taskItem.hasClass('completed')) {
          $taskItem.removeClass('completed');
          updateTaskCounter('increment');
        } else {
          $taskItem.addClass('completed');
          updateTaskCounter('decrement');
        }
      });
  });
}

$( document ).on('turbolinks:load', function() {
  onLoadEvents();
});

$( window ).on('load', function() {
  onLoadEvents();
});