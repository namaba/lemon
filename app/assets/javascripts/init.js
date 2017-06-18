$(function(){
  $('.thumb li').click(function(){
      var class_name = $(this).attr("class"); //クリックしたサムネイルのclass名を取得
      var num = class_name.slice(5); //class名の末尾の数字を取得
      $('.main li').hide(); //メインの画像を全て隠す
      $('.item' + num).fadeIn(); //クリックしたサムネイルに対応するメイン画像を表示
  });
});

// modal
$(function(){
  $('.btns').click(function(){
    wn = '.' + $(this).data('tgt');
    var mW = $(wn).find('.modalBody').innerWidth() / 2;
    var mH = $(wn).find('.modalBody').innerHeight() / 2;
    $(wn).find('.modalBody').css({'margin-left':-mW,'margin-top':-mH});
    $(wn).fadeIn(500);
  });
  $('.close,.modalBK').click(function(){
    $(wn).fadeOut(500);
  });
});


// ヘッダー
$(function(){
  var url = $(location).attr('href');
  $('#menu').find('a').each(function(){
    var link = $(this).attr('href');
    if(link == url){
      $(this).addClass('on');
    }
  });
});



// コミュニティぺーじのタブ
// $(function() {
//   //クリックしたときのファンクションをまとめて指定
//   $('.tab_header .tab_bottun').click(function() {

//     //.index()を使いクリックされたタブが何番目かを調べ、
//     //indexという変数に代入します。
//     var index = $('.tab_header .tab_bottun').index(this);

//     //コンテンツを一度すべて非表示にし、
//     $('.tab_content').css('display','none');

//     //クリックされたタブと同じ順番のコンテンツを表示します。
//     $('.tab_content').eq(index).css('display','block');

//     //一度タブについているクラスselectを消し、
//     $('.tab_header .tab_bottun').removeClass('select');

//     //クリックされたタブのみにクラスselectをつけます。
//     $(this).addClass('select')
//   });
// });