$ ->
  $('.messages .message_delete').bind 'click', ->
    id = $(this).attr 'data'
    payload =
      url: 'notifications/'+id
      type: 'delete'
      dataType: 'json'
    $.ajax(payload).success (result)->
        if result.status == 'success'
          console.log 'delete success'
          $('#notification-'+id).remove()
      .fail (result) ->
        console.log result

