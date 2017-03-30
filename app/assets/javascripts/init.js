$(function(){
  $('.thumb li').click(function(){
      var class_name = $(this).attr("class"); //クリックしたサムネイルのclass名を取得
      var num = class_name.slice(5); //class名の末尾の数字を取得
      $('.main li').hide(); //メインの画像を全て隠す
      $('.item' + num).fadeIn(); //クリックしたサムネイルに対応するメイン画像を表示
  });
});
