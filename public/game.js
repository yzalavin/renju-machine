var colors = {
  human: '#9966ff',
  machine: '#008fb3'
}

function tagField(field, color){
  $(field).css('background', color);
  $(field).addClass('tagged');
}

$(function(){
  tagField('td#h8', colors.human);
  $("td").on('click', function(){
    if ($(this).hasClass('tagged')){
      alert('Не стоит этого делать');
    } else {
      tagField(this, colors.human)
      $.post('step', {el: $(this).attr('id')}, function(data){
        tagField($('td#' + data), colors.machine);
      })
    }
  })
})
