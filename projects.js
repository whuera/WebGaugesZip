function templateRow() {
    var template = "<tr>";
    template += ("<td>" + "123" + "</td>");
    template += ("<td>" + "Jorge Junior" + "</td>");
    template += ("<td>" + "Rodriguez Castillo" + "</td>");
    template += ("<td>" + "123" + "</td>");
    template += ("<td>" + "123" + "</td>");
    template += ("<td>" + "123" + "</td>");
    template += ("<td>" + "123" + "</td>");
    template += "</tr>";
    return template;
}

function addRow() {
    var template = templateRow();
    for (var i = 0; i < 10; i++) {
        $("#tbl_body_table").append(template);
    }
}

var tabla, data;
//crear y llenar el datatable
function addRowDT(data) {
    tabla = $("#tbl_projects").DataTable({
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        "bDestroy": true,
        "aoColumns": [
            null,
            null,
            null,
            null,
            null,         
            {"bSortable" : false}
        ]
    });

    tabla.fnClearTable();

    for (var i = 0; i < data.length; i++) {
        tabla.fnAddData([
            data[i].id_proyectos,
            data[i].nombre_proyecto,
            data[i].codigo_proyecto,
            data[i].estatus_proyecto,            
            data[i].observacion_proyecto,
            '<button type="button" value="Ver" title="Ver" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal">Ver</button>&nbsp;' +
            '<button type = "button" value = "Evaluar" id="btn_evalprj" onclick="showFormRol(userAppRole);" title = "Evaluar" class= "btn btn-success">Evaluar</button>'
            
           
        ]);
    }
    //  ((data[i].Estado == true) ? "Activo" : "Inactivo")
}

//llamar al webservice que trae la data de proyectos
function sendDataAjax(idProject) {
    var obj = JSON.stringify({ id: JSON.stringify(idProject) });    
    $.ajax({
        type: "POST",
        url: "BuscarProyectos.aspx/getProjectById",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        beforeSend: function () {
            $("#loader-4").show();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            console.log(data.d);
            $("#loader-4").hide();
            addRowDT(data.d);
        }
    });
}



function updateDataAjax() {
    var obj = JSON.stringify({ id_project: $("#id_project").val(), planneddate: $("#planneddate").val(), deliverydate: $("#deliverydate").val(), observation1: $("#observation1").val(), numver: $("#numver").val(), observation2: $("#observation2").val(), numprod: $("#numprod").val(), observation3: $("#observation3").val() });
   // var obj = JSON.stringify({ id_proyectos: $("#numver").val(), nombre_indicador: $("#numver").val() });
   // alert(nombre_indicador);
    $.ajax({
        type: "POST",
        url: "BuscarProyectos.aspx/createGaugesById",
        data: obj,
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
            alert("Error al intentar guardar el registro.");
        },
        success: function (data) {
            console.log(data.d);           
                alert("Registro ingresado de manera correcta.");
        }
    });
}

function deleteDataAjax(data) {

    var obj = JSON.stringify({ id: JSON.stringify(data) });

    $.ajax({
        type: "POST",
        url: "GestionarPaciente.aspx/EliminarDatosPaciente",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                alert("Registro eliminado de manera correcta.");
            } else {
                alert("No se pudo eliminar el registro.");
            }
        }
    });
}

// evento click para boton actualizar
$(document).on('click', '.btn-edit', function (e) {
    e.preventDefault();

    var row = $(this).parent().parent()[0];
    data = tabla.fillModalData(row);
    fillModalData();

});

// evento click para boton eliminar
$(document).on('click', '.btn-delete', function (e) {
    e.preventDefault();

    //primer método: eliminar la fila del datatble
    var row = $(this).parent().parent()[0];
    var dataRow = tabla.fnGetData(row);

    //segundo método: enviar el codigo del paciente al servidor y eliminarlo, renderizar el datatable
    // paso 1: enviar el id al servidor por medio de ajax
    deleteDataAjax(dataRow[0]);
    // paso 2: renderizar el datatable
    sendDataAjax();

});


// cargar datos en el modal
function fillModalData() {
    $("#txtFullName").val(data[1] + " " + data[2]);
    $("#txtModalDireccion").val(data[5]);
}

// enviar la informacion al servidor
$("#btnactualizar").click(function (e) {
    e.preventDefault();
    updateDataAjax();
});

// Llamando a la funcion de ajax al cargar el documento
//sendDataAjax();

//set today to input

$(document).ready(function () {
    document.getElementById('planneddate').valueAsDate = new Date();
    document.getElementById('deliverydate').valueAsDate = new Date();   
    $("#loader-4").hide();
    
    //get element id
    var elplanneddate = document.getElementById("planneddate");
    var eldeliverydate = document.getElementById("deliverydate");
    var elobservation1 = document.getElementById("observation1");
    var elnumver = document.getElementById("numver");
    var elobservation2 = document.getElementById("observation2");
    var elnumprod = document.getElementById("numprod");
    var elobservation3 = document.getElementById("observation3");
    //set opacity attribute
    if (elplanneddate.style.opacity !== undefined) {
        elplanneddate.style.opacity = 0.8;
        eldeliverydate.style.opacity = 0.8;
        elobservation1.style.opacity = 0.8;
        elnumver.style.opacity = 0.8;
        elobservation2.style.opacity = 0.8;
        elnumprod.style.opacity = 0.8;
        elobservation3.style.opacity = 0.8;
    } 
});

//delay function
$(window).delay(5000).queue(function () {
    $.post({});
});
//get value from hidden control
var userAppRole = $("#id_app_role").val(); 
//show form div 1
function showFormRol(valUserAppRole) {        
    if (valUserAppRole == 1) {
        $('#rol1').removeClass('hidden');        
    }
    else if(valUserAppRole == 2){
        $('#rol2').removeClass('hidden');
    }
    else if(valUserAppRole == 3){
        $('#rol3').removeClass('hidden');
    }
    $('.btn_evalprj').prop('disabled', true);
    console.log('value from id_roles: ' + userAppRole);
    
}

//star rating
jQuery(document).ready(function ($) {

    $(".btnrating").on('click', (function (e) {

        var previous_value = $("#selected_rating").val();

        var selected_value = $(this).attr("data-attr");
        $("#selected_rating").val(selected_value);

        $(".selected-rating").empty();
        $(".selected-rating").html(selected_value);

        for (i = 1; i <= selected_value; ++i) {
            $("#rating-star-" + i).toggleClass('btn-warning');
            $("#rating-star-" + i).toggleClass('btn-default');
        }

        for (ix = 1; ix <= previous_value; ++ix) {
            $("#rating-star-" + ix).toggleClass('btn-warning');
            $("#rating-star-" + ix).toggleClass('btn-default');
        }

    }));


});

    