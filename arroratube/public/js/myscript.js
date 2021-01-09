
$(document).ready(function () {
    $("li a.menu0").click(function (evt) {
        evt.preventDefault();
        $("ul.cl-effect-0").slideToggle(300, function () {
            // Animation complete.
        });
    });

    $("li a.menu1").click(function (evt) {
        evt.preventDefault();
        $("ul.cl-effect-1").slideToggle(300, function () {
            // Animation complete.
        });
    });
    $("li a.menu2").click(function (evt) {
        evt.preventDefault();
        $("ul.cl-effect-2").slideToggle(300, function () {
            // Animation complete.
        });
    });
    $("li a.menu3").click(function (evt) {
        evt.preventDefault();
        $("ul.cl-effect-3").slideToggle(300, function () {
            // Animation complete.
        });
    });
    $("li a.menu4").click(function (evt) {
        evt.preventDefault();
        $("ul.cl-effect-4").slideToggle(300, function () {
            // Animation complete.
        });
    });
    $("li a.menu5").click(function (evt) {
        evt.preventDefault();
        $("ul.cl-effect-5").slideToggle(300, function () {
            // Animation complete.
        });
    });

    $(".top-navigation").click(function () {
        $(".drop-navigation").slideToggle(300, function () {
            // Animation complete.
        });
    });


    // $(window).scroll(fatchPosts);

    // function fatchPosts() {
    //     var page = $('.endless-pagination').data('next-page');
    //     //console.log(page);
    //     if (page !== null) {

    //         clearTimeout($.data(this, "scrollCheck"));

    //         $.data(this, "scrollCheck", setTimeout(function () {
    //             if ($(window).scrollTop() + $(window).height() + 800 >= $(document).height()) {
    //                 $('.ajax-load').show();
    //                 $.get(page, function (data) {
    //                     $('.ajax-load').hide();
    //                     $("#videos-body").append(data.html);
    //                     $('.endless-pagination').data('next-page', data.next_page);
    //                 });
    //             }
    //         }, 350));

    //     }
    // }
})
