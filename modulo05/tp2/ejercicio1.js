const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');

// let persona = JSON.parse(rawdata);
// console.log(persona);

console.log(JSON.stringify(rawdata)); 


// JSON.stringify convierte un objeto de javascript a una cadena json en formato buffer (formato buffer puesto que usamos readFile el cual trabaja con este formato de manera predeterminada)
// JSON.parse convierte el archivo JSON a objeto js.