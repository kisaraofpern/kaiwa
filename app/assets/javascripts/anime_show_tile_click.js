$(".left").click(function () {
  $(".panel").css("width","100%");
  $(".left").hide();
  $(".right").show();
});

$(".right").click(function () {
  $(".panel").css("width","200%");
  $(".right").hide();
  $(".left").show();
});
