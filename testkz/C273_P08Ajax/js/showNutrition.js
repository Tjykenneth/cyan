
$(document).ready(function () {
    loadNutrition();
})

function loadNutrition() {
    $.ajax({
        type: "GET",
        url: "http://localhost/C273WebServices/getNutrition.php",
        cache: false,
        dataType: "JSON",
        success: function (response) {
            var message = "<thead><tr><th>Food</th><th>Calories</th><th>Fat</th><th>Protein</th><th>Carbs</th><th>Fibre</th></tr></thead>";
            for(i=0; i < response.length; i++){
            message += "<body><tr><td>" + response[i].food + "</td>" + "<td>" + response[i].calories + "</td><td>" + response[i].fat + "</td><td>"
                    + response[i].protein + "</td><td>" + response[i].carbs + "</td><td>" + response[i].fiber + "</td></tr></tbody>"};
            $("#nutritionTable").html(message);

        },
        error: function (obj, textStatus, errorThrown) {
            console.log("Error " + textStatus + ": " + errorThrown);
        }
    });
}
