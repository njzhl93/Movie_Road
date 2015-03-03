$(function() {
    $("div#reply").hide();
    $("a#show").click(function(event) {
        event.preventDefault();
        $("div#reply").toggle();
    });
});