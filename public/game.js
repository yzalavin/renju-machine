var colors = {
  human: '#9966ff',
  machine: '#008fb3'
}

var tengen = "td#h8";
var tag = 'tagged';

function tagField(field, color){
  $(field).css('background', color);
  $(field).addClass(tag);
}

$(function(){
  tagField(tengen, colors.human);
  tagField('td#h9', colors.machine);
  $("td").on('click', function(){
      if ($(this).hasClass('tagged')){
        alert('Не стоит этого делать');
      } else {
        tagField(this, colors.human)
        $.post('step', {el: $(this).attr('id')}, function(data){
          console.log(data);
          if (data == 'win') {
            alert('Это победа!');
          } else if (data == 'loose'){
            alert('Неудача!');
          } else if (data == 'draw'){
            alert('Что ж! Победитель не выявлен.')
          } else {
            tagField($('td#' + data), colors.machine);
          }
        })
      }
    })
})
