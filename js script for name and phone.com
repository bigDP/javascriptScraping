//for ....com
var x = document.querySelectorAll(".box_container");
var myarray = []
for (var i=0; i<x.length; i++){
var cleantext = x[i].querySelectorAll(".big_link")[0].innerText.split("http")[0];
var cleanlink = x[i].querySelectorAll(".details > div")[0].innerText.split("address")[0];
myarray.push([cleantext,cleanlink]);
};
function make_table() {
    var table = '<table><thead><th>Name</th><th>Links</th></thead><tbody>';
   for (var i=0; i<myarray.length; i++) {
            table += '<tr><td>'+ myarray[i][0] + '</td><td>#</td><td>' +myarray[i][1]+'</td></tr>';
    };
 
    var w = window.open("");
w.document.write(table); 
}
make_table()
