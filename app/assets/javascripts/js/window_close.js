$(function(){
    var close = $('#windowclose');
    close.click(function(){
        window.open('about:blank','_self').close();
    });
});


// ブラウザバック後のスクロール位置の復元に試みたが断念

// const element = $("#timeline-scroll")
// // element.scroll(function() {
// $("#comment").click(function(){
//     var scrollPos = element.scrollTop();
//     $.attr(element, 'data-pos', scrollPos);
// });
//     //     // localStorage.setItem('key', scrollPos);
// })
//
// $(document).ready(function(){
//     var pos = $.attr(element, 'data-pos');
//     element.scrollTop(pos);
// });

// $(document).ready(function(){
//     $('#timeline-scroll').scrollTop(100);
// });

// $(document).ready(function() {
//     var scrollBase = $("#timeline-scroll")
//     scrollBase.history.scrollRestoration = "auto" ;
// });


