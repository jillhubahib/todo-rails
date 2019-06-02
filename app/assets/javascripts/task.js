function deleteTask(idOrAll) {
  $.ajax({
      method: "DELETE",
      headers: { 'X-CSRF-Token': Rails.csrfToken() },
      url: "/tasks/" + idOrAll
    })
    	.done(function() {
    		window.location = "/";
    	});
}

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

  $('.task-item-delete').click(function() {
    $('.task-item-delete-confirmation').attr("data-value", $(this).attr('data-value'));
    $('.task-modal').modal('show');
  });

  $('.task-item-delete-confirmation').click(function() {
    deleteTask($(this).attr('data-value'));
  });

  $('.task-item-delete-all').click(function() {
    $('.task-item-delete-confirmation').attr("data-value", 'all');
    $('.task-modal').modal('show');
  });
}

$( document ).on('turbolinks:load', function() {
  onLoadEvents();
});

$( window ).on('load', function() {
  onLoadEvents();
});