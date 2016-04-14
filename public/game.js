var colors = {
  human: '#9966ff',
  comp: '2290B5'
}

function getGridState(){
}

function tagField(field, color){
  $(field).css('background', color);
  $(field).prop('data-tagged', true);
}

$(function(){
  tagField('td#h8', colors.human);
  $("td").on('click', function(){
    tagField(this, colors.human)
    $.post('play', {el: $(this).attr('id')})
  })
})
