$(document).ready(function(){


  $('#yes').click(function(){
     $('#yes').hide()
     $('#no').hide()
     $('preview').hide()
     $('#question').text("Loading. Please wait.")
     $("question-desc").text(".")
  })

   $('#no').click(function(){
     $('#yes').hide()
     $('#no').hide()
          $('#question').text("Loading. Please wait.")
  })

})
