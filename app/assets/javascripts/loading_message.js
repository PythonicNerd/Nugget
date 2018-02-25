$body = $("body");

$(document).on({
    ajaxStart: function() { $body.addClass("loading-msg");    },
     ajaxStop: function() { $body.removeClass("loading-msg"); }
});
