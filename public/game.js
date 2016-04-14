var colors = {
  human: '#9966ff',
  machine: '#008fb3'
}

function tagField(field, color){
  $(field).css('background', color);
  // $(field).prop('data-tagged', true);
}

$(function(){
  tagField('td#h8', colors.human);
  $("td").on('click', function(){
    tagField(this, colors.human)
    $.post('step', {el: $(this).attr('id')}, function(data){
      tagField($('td#' + data), colors.machine);
    })
  })
})
