$(document).ready(function() {

    var dataEmployee = {};


    $("#new-employee").on("click", function () {
        dataEmployee = {};
        $('#input-employee-email').val("");
        $('#input-employee-fullname').val("");
        $('#input-employee-username').val("");
    });


    $(".edit-employee").on("click", function () {
        var employeeInfo = $(this).data("employee");
        NProgress.start();
        axios.get("/api/employee/detail/" + employeeInfo).then(function(res){
            NProgress.done();
            if(res.data.success) {
                dataEmployee.id = res.data.data.id;
                $("#input-employee-username").val(res.data.data.username);
                $("#input-employee-email").val(res.data.data.email);
                $("#input-employee-fullname").val(res.data.data.fullname);

            }else {
                console.log("ahihi");
            }
        }, function(err){
            NProgress.done();
        })
    });



    $("#save-employee").on("click", function () {
        if($("#input-employee-fullname").val() === "" || $("#input-employee-email").val() === "" || $("#input-employee-username").val() === "") {
            swal(
                'Error',
                'You need to fill all values',
                'error'
            );
            return;
        }


        dataEmployee.fullname = $('#input-employee-fullname').val();
        dataEmployee.email = $('#input-employee-email').val();
        dataEmployee.username = $('#input-employee-username').val();

        NProgress.start();
        var linkPost = "/api/employee/create";
        if(dataEmployee.id) {
            linkPost = "/api/employee/update/";
        }

        axios.post(linkPost, dataEmployee).then(function(res){
            NProgress.done();
            if(res.data.success) {
                swal(
                    'Good job!',
                    res.data.message,
                    'success'
                ).then(function() {
                    location.reload();
                });
            } else {
                swal(
                    'Error',
                    res.data.message,
                    'error'
                );
            }
        }, function(err){
            NProgress.done();
            swal(
                'Error',
                'Some error when saving employee',
                'error'
            );
        })
    });



    $(".delete-employee").on("click", function () {
        dataEmployee = {};
        dataEmployee.id = $(this).data("employee");
    });
    $(".btn-delete-employee").on("click",function(){



        NProgress.start();
        var linkGet = "/api/employee/delete/"+dataEmployee.id;
        axios.delete(linkGet).then(function(res){
            NProgress.done();
            if(res.data.success) {
                swal(
                    'Success',
                    res.data.message,
                    'success'
                ).then(function() {
                    location.reload();
                });
            } else {
                swal(
                    'Fail',
                    res.data.message,
                    'error'
                );
            }
        }, function(err){
            NProgress.done();
            swal(
                'Error',
                'Fail',
                'error'
            );
        });
    })


});