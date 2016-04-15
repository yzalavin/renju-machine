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
        if (data.split(',')[0] == 'human_wins') {
          alert('Это победа!');
        } else if (data.split(',')[0] == 'machine_wins'){
          tagField($("td#" + data.split(",")[1]), colors.machine);
          alert('Неудача! Машина сильнее!');
        } else if (data.split(',')[0] == 'draw'){
          alert('Что ж! Победитель не выявлен.')
        } else {
          tagField($('td#' + data), colors.machine);
        }
      })
    }
    })
})
