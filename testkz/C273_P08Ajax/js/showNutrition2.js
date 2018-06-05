
$(document).ready(function () {
    loadNutrition();
})

function loadNutrition() {
    $.ajax({
        type: "GET",
        url: "http://localhost/C273WebServices/getNutrition2.php",
        cache: false,
        dataType: "JSON",
        success: function (response) {
            for (i = 0; i < response.length; i++) {
                $("#accordion").append(
                        "<h3>" + response[i].food + "</h3>"
                        + "<div><p><b>Calories: </b> " + response[i].calories + "<br/>"
                        + "<b> Fat: </b>" + response[i].fat + "<br/>"
                        + "<b> Protein: </b>" + response[i].protein + "<br/>"
                        + "<b> Carbs: </b>" + response[i].carbs + "<br/>"
                        + "<b> Fibre: </b>" + response[i].fiber + "<br/>"
                        );
            }
            $("#accordion").accordion();
        }
    });
};




