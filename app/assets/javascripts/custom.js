/*
$(document).ready(function() {
    $('.btn-main-menu').click(function () {
        $('.column-1').addClass('animated fadeOutLeft')
        //$(this).preventDefault();
    });
});
*/
/*


var loaded = function() {
    var left = "fadeOutLeft";
    var right = "fadeOutRight";
    var fade_out = "zoomOut";


    $('.column-1').on("click", function () {

        $(".column-2").addClass(right);
        $(".column-2").one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
            function (e) {
                $(".column-2").removeClass(right);
            });

        $(".column-3").addClass(right);
        $(".column-3").one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
            function (e) {
                $(".column-3").removeClass(right);
            });


    });

    $('.column-2').on("click", function () {
        $(".column-1").addClass(left);
        $(".column-2").addClass(right);
        $(".column-3").addClass(right);
    });
    $('.column-3').on("click", function () {
        $(".column-1").addClass(left);
        $(".column-2").addClass(left);
    });

};

 */

/*

$(document).onunload(function() {
    $("#column-1").id.removeClass("fadeOutLeft");
    $("#column-2").id.removeClass("fadeOutRight");
    $("#column-3").id.removeClass("fadeOutRight");
});

*/

$(document).on('page:load ready', loaded);

