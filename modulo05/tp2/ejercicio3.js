"use strict";
const fs = require("fs");
fs.readFile("personas.json", (err, data) => {
  if (err) throw err;
  //console.log(JSON.parse(data));
  console.log(JSON.stringify(data));
  console.log(data);
});

// El metodo stringify va a convertir lo que le pasemos como parametro (en este caso 'data') en una cadena JSON, pero como el parametro mismo es un JSON, el metodo no hace ninguna conversion sino que devuelve el propio JSON en formato buffer (buffer porque el metodo readFile lee los archivos en este formato.)
// con 'console.log(data);' la consola nos proporciona los datos que lee el metodo readFile en formato buffer.