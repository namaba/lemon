$(function(){
  $('.thumb li').click(function(){
      var class_name = $(this).attr("class"); //クリックしたサムネイルのclass名を取得
      var num = class_name.slice(5); //class名の末尾の数字を取得
      $('.main li').hide(); //メインの画像を全て隠す
      $('.item' + num).fadeIn(); //クリックしたサムネイルに対応するメイン画像を表示
  });


  // modal
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



  // ヘッダー
  var url = $(location).attr('href');
  $('#menu_pc').find('a').each(function(){
    var link = $(this).attr('href');
    if(link == url){
      $(this).addClass('on');
    }
  });



  var setFileInput = $('.imgInput'),
  setFileImg = $('.imgView');

  setFileInput.each(function(){
    var selfFile = $(this),
    selfInput = $(this).find('input[type=file]'),
    prevElm = selfFile.find(setFileImg),
    orgPass = prevElm.attr('src');

    selfInput.change(function(){
      var file = $(this).prop('files')[0],
      fileRdr = new FileReader();

      if (!this.files.length){
        prevElm.attr('src', orgPass);
        return;
      } else {
        if (!file.type.match('image.*')){
          prevElm.attr('src', orgPass);
          return;
        } else {
          fileRdr.onload = function() {
            prevElm.attr('src', fileRdr.result);
          }
          fileRdr.readAsDataURL(file);
        }
      }
    });
  });


  // スマホ版ナブバー
  $("#menu_sp").click(function () {
    $(".navbar_sp").toggle();
    // $(".navbar_sp").toggleClass('display','block');
    $("#layout_content").toggleClass('paddingTop');
  });


  // アクセス時モーダル
  $('#layer_board_area').layerBoard({
    delayTime: 1000,
    fadeTime : 1000,
    alpha : 0.8,
    limitMin : 5,
    easing: 'swing',
    limitCookie : 1
  });



  // スライダー
  var swiper = new Swiper('.swiper-container', {
    //オプションをここに:
    mode:'horizontal',
    autoplay: 5000,
    loop: true,
    autoResize: true,
    scrollContainer: true,
    grabCursor: true,
    nextButton: '.swiper-button-next',
    // prevButton: '.swiper-button-prev',
    slidesPerView: 1,
  });



  // チュートリアル
  window.addEventListener('DOMContentLoaded', function() {
    if(gon.tutorial_status == 'pending'){
      $('.registration-tutorial-bg').fadeIn(3000);
      $('.registration-tutorial-box').fadeIn(3000);
      $('.mypage_profile_registrate_box').fadeIn(3000);
      $('.tutorial_active').fadeIn(3000);
    }
  });


  $('.change-btn').click(function() {
    // 変数$displaySlideを定義してください
    var $displaySlide = $('.tutorial_active');

    // 変数$displaySlideからactiveクラスを取り除いてください
    $displaySlide.removeClass('tutorial_active');

    // ifとelseを用いて、$displaySlideの前もしくは次の要素に
    // activeクラスをつけてください
    $displaySlide.next().addClass('tutorial_active');
  });


  $(".charge_button").click(function() {
    $(".stripe-button-el").trigger('click');
  });
});