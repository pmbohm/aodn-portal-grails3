
$(document).ready(function() {


    var facets = [
        {
            text: "Acoustics",
            nodes: [
                {
                    text: "Child 1",
                    nodes: [
                        {
                            text: "Grandchild 1"
                        },
                        {
                            text: "Grandchild 2"
                        }
                    ]
                },
                {
                    text: "Child 2"
                }
            ]
        },
        {
            text: "Air-Sea Fluxes"
        },
        {
            text: "Temperature"
        }
    ];


    $('#tree').treeview({
        data: facets,
        backColor: '#1d6e9ead',
        onhoverColor: '#0d3a57',
        showBorder: false
    });



});
