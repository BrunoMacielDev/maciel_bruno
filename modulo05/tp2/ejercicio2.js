"use strict";
let jsonData = require("./personas.json");
//console.log(jsonData);

console.log(JSON.stringify(jsonData));

//JSON.stringify transforma el archivo json en string

console.log(JSON.parse(jsonData));

// Cuando se utiliza el JSON.parse surge un error. Esto surge puesto que el metodo parse interpreta al archivo como un JSON no valido.
