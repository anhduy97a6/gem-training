$(document).ready(function() {

    var attrInfo;
    var dataAttr = {};


    $(".delete-column").on("click", function () {
        attrInfo = $(this).data("attribute");
    });


    $("#save-column").on("click", function () {
        if ($('#input-column').val() === "") {}
        dataAttr.name = $("#input-column").val();
        NProgress.start();
        axios.post("/api/employee/detail/" + employeeInfo).then(function(res){
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





    $(".btn-delete-column").on("click",function(){



        NProgress.start();
        var linkGet = "/api/solution/delete/"+attrInfo;
        axios.get(linkGet).then(function(res){
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