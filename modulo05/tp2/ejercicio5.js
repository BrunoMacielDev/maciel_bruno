const fs = require("fs");
const rawdata = fs.readFileSync("./departamentos.json", "utf8");
var departamento = JSON.parse(rawdata);

for (
  let i = 0;
  i < departamento["departamentos"][1]["Tecnologia"].length;
  i++
) {
  console.log(
    departamento["departamentos"][1]["Tecnologia"][i]["nombre"] +
      " " +
      departamento["departamentos"][1]["Tecnologia"][i]["puesto"]
  );
}
