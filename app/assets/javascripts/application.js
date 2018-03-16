// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require cocoon
//= require bootstrap-sprockets-custom
//= require turbolinks
//= require social-share-button
//= require_tree .

  // 入力欄の文字数カウントダウン
  function CountDownLength( idn, str, mnum ) {
  document.getElementById(idn).innerHTML = "あと" + (mnum - str.length) + "文字";
  }
  // 画像プレビュー
  $.fn.upimageview = function( preview_selector , error_message ){
    var default_preview_src = $(preview_selector).attr('src');
    var default_type = $(this).attr('default_type') || 'image/jpeg';
    var max_filesize = $(this).attr('maxsize') || 0;
    var accept_type  = $(this).attr('accept')  || '';
    var errmsg_size  = $(this).attr('maxsize_msg') || 'file size must be less than '+max_filesize;
    var errmsg_type  = $(this).attr('accept_msg')  || 'acceptable file type is '+accept_type;
    $(this).on("change", function(){
      var file = $(this).prop('files')[0];
      if ( accept_type != '' && accept_type.indexOf( file.type ) == -1 ) {
      show_error( $(this) , errmsg_type );
      return false;
      }
      if ( max_filesize > 0 && file.size > max_filesize ) {
                show_error( $(this) , errmsg_size );
                return false;
            }
            var fr = new FileReader();
            fr.onload = function() {
                // set image data to src attribute
                var src = fr.result;
                if ( src.substring(5,11) == 'base64' ) { // if cant detect mimetype,force to set image/jpeg
                    src = 'data:' + default_type + ';' + src.substring(5);
                }
                $(preview_selector).attr('src', src);
            }
            // read image file
            fr.readAsDataURL(file);
        });
        function show_error( obj , message ) {
            if ( message != '' ) alert(message);
            $(preview_selector).attr('src', default_preview_src);
            return false;
        }
    }
    // タブ切り替えメニュー
    $(function() {
        //クリックしたときのファンクションをまとめて指定
        $('.nav-tab-button-inner p').click(function() {
            //.index()を使いクリックされたタブが何番目かを調べ、
            //indexという変数に代入します。
            var index = $('.nav-tab-button-inner p').index(this);
            //コンテンツを一度すべて非表示にし、
            $('.user-contents li').css('display','none');
            //クリックされたタブと同じ順番のコンテンツを表示します。
            $('.user-contents li').eq(index).css('display','block');
            //一度タブについているクラスselectを消し、
            $('.nav-tab-button-inner p').removeClass('router-link-active');
            //クリックされたタブのみにクラスselectをつけます。
            $(this).addClass('router-link-active')
        });
    });
