$(function () {
  var before = $('.text');
  var text = before.text(); // 文字をspanタグで囲む前のテキストを取得
  var textArray = text.split('');  // 取得したテキストを1文字ずつに分割し配列にして変数に格納
    
  let after = '';
  $.each(textArray,function(index,val){ // 配列の各文字をspanタグで囲み、繋げていく
    after += "<h1>" + val + "</h1>";
  });  
    
  before.html(after);  // 元のテキストに生成したタグごと置き換え
    
  var textcnt = textArray.length;
  var circleR = ($('.circle').height()) / 2; // 円の半径
  var fontH = ($('.inner').height());
  var dist = circleR - fontH;
  var animTime = $('.text').css('animation-duration').slice(0, -1);  // アニメーション時間を取得し、「s」を切り捨て
    
  $('h1').each(function(index) {
    var num = index + 1;
    var radX = Math.sin(360 / textcnt * num * (Math.PI / 180)); // 文字の中心からのX軸方向の移動距離を計算
    var radY = Math.sin((90 - (360 / textcnt * num)) * (Math.PI / 180)); // 文字の中心からのY軸方向の移動距離（実際にはマイナス移動）を計算
    $(this).css({'transform': 'translate(' + dist * radX + 'px, ' + -(dist * radY) + 'px) rotateX(90deg) rotateY(' + 360 / textcnt * num + 'deg)', //1文字ずつ円形に等間隔で円形に配置
                'animation-delay': animTime / textcnt * num + 's', // 1文字ずつアニメーション開始時間を遅延
                  });  //
  });
});