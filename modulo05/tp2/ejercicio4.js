const fs = require("fs");
const rawdata = fs.readFileSync("./personas.json", "utf8");
var persona = JSON.parse(rawdata);

function getNombre() {
    for (var i = 0; i < persona["personas"].length; i++) {
      if (persona["personas"][i]["localidad"]=="Posadas") {
        console.log(persona["personas"][i]["nombre"]+' '+persona["personas"][i]["apellido"]);
      }
      };
}

console.log(getNombre())