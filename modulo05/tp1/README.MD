# CURSO PROGRAMACIÓN WEB FULL STACK - NIVEL 2
### MÓDULO 5 - Programación Backend

### JSON
JSON (acrónimo de JavaScript Object Notation, 'notación de objeto de JavaScript') es un formato de texto sencillo para el intercambio de datos. Se trata de un subconjunto de la notación literal de
objetos de JavaScript, aunque, debido a su amplia adopción como alternativa a XML, se considera un formato independiente del lenguaje.
#### Los tipos de datos disponibles con JSON son:
- **Números**: Se permiten números negativos y opcionalmente pueden contener parte fraccional separada por puntos. Ejemplo: 123.456
- **Cadenas**: Representan secuencias de cero o más caracteres. Se ponen entre doble comilla y se permiten cadenas de escape. Ejemplo: "Hola
- **Booleanos**: Representan valores booleanos y pueden tener dos valores: true y false
- **null**: Representan el valor nulo
- **Array**: Representa una lista ordenada de cero o más valores los cuales pueden ser de cualquier tipo. Los valores se separan por comas y el vector se mete entre corchetes. Ejemplo ["juan","pedro","jacinto"]
- **Objetos**: Son colecciones no ordenadas de pares de la forma <nombre>:<valor> separados por comas y puestas entre llaves. El nombre tiene que ser una cadena entre comillas dobles. El valor puede ser de cualquier tipo. Ejemplo
```
  {
    "departamento":8,
    "nombredepto":"Ventas",
    "director": "Juan Rodríguez",
    "empleados":[
         {
          "nombre":"Pedro",
          "apellido":"Fernández"
         },{
          "nombre":"Jacinto",
          "apellido":"Benavente"
         }
       ]
  }
```
### Ejemplos de JSON
En una planta de envasado de líquidos, disponen de 5 tipos de envases, 3 tipos de contenedores
para empaquetar grupos de envases y 10 tipos de líquidos que pueden ser almacenados en los
envases. Sin embargo, hay ciertas restricciones en los líquidos que pueden ser almacenados en
cada envase y los tamaños de los envases hacen que no se pueda almacenar todos los envases
en todos los contenedores.
- Tenemos contenedores:
  - Grandes, acepta envases grandes
  - Medianos, no acepta envases grandes
  - Verticales, acepta envases altos
- Tenemos envases:
  - Grande ancho, válido para alimentos
  - Grande alto, válido para alimentos
  - Mediano ancho, válido para alimentos
  - Mediano alto, resistente a sustancias corrosivas
  - Pequeño, resistente a sustancias corrosivas
- Tenemos líquidos:
  - Agua
  - Leche
  - Lejía
  - Amoniaco
  - Jabón
  - Aguarrás
  - Gasolina
  - Aceite
  - Vinagre
  - Alcohol
  
Para estos líquidos, envases y contenedores, se puede representar la información en un archivo JSON, quedando de la siguiente manera:
```
{
  "contenedores": [
        {
          "tipo": "Grande",
          "envases": [
              {
                "tipo": "Grande Ancho",
                "liquidos": [
                    {
                      "tipo": "alimento",
                      "text": "Agua"
                    },
                    {
                      "tipo": "alimento",
                      "text": "Leche"
                    },
                    {
                      "tipo": "alimento",
                      "text": "Aceite"
                    },
                    {
                      "tipo": "alimento",
                      "text": "Vinagre"
                    }
                ]
              },
              {
                "tipo": "Grande Alto",
                "liquidos": [
                    {
                      "tipo": "alimento",
                      "text": "Agua"
                    },
                    {
                      "tipo": "alimento",
                      "text": "Leche"
                    },
                    {
                      "tipo": "alimento",
                      "text": "Aceite"
                    },
                    {
                      "tipo": "alimento",
                      "text": "Vinagre"
                    }
                    ]
                }
                ]
              },
        {
          "tipo": "Mediano",
          "envases": [
              {
                "tipo": "Mediano Ancho",
                "liquidos": [
                    {
                      "tipo": "alimento",
                      "text": "Agua"
                    },
                    {
                      "tipo": "alimento",
                      "text": "Leche"
                    },
                    {
                      "tipo": "alimento",
                      "text": "Aceite"
                    },
                    {
                      "tipo": "alimento",
                      "text": "Vinagre"
                    }
                 ]
              },
              {
                "tipo": "Mediano Alto",
                "liquidos": [
                    {
                      "tipo": "corrosivo",
                      "text": "Lejía"
                    },
                    {
                      "tipo": "corrosivo",
                      "text": "Amoniaco"
                    },
                    {
                      "tipo": "corrosivo",
                      "text": "Jabón"
                    },
                    {
                      "tipo": "corrosivo",
                      "text": "Aguarrás"
                    },
                    {
                      "tipo": "corrosivo",
                      "text": "Gasolina"
                    },
                    {
                      "tipo": "corrosivo",
                      "text": "Alcohol"
                    }
              ] 
          },
          {
          "tipo": "Pequeño",
          "liquidos": [
              {
                "tipo": "corrosivo",
                "text": "Lejía"
              },
              {
                "tipo": "corrosivo",
                "text": "Amoniaco"
              },
              {
                "tipo": "corrosivo",
                "text": "Jabón"
              },
              {
                "tipo": "corrosivo",
                "text": "Aguarrás"
              },
              {
                "tipo": "corrosivo",
                "text": "Gasolina"
              },
              {
                "tipo": "corrosivo",
                "text": "Alcohol"
              }
              ]
            }
          ]
          },
          {
            "tipo": "Vertical",
            "envases": [
                {
                  "tipo": "Grande Alto",
                  "liquidos": [
                {
                  "tipo": "alimento",
                  "text": "Agua"
                },
                {
                  "tipo": "alimento",
                  "text": "Leche"
                },
                {
                  "tipo": "alimento",
                  "text": "Aceite"
                },
                {
                  "tipo": "alimento",
                  "text": "Vinagre"
                }
              ]
            },
            {
              "tipo": "Mediano Alto",
              "liquidos": [
                  {
                    "tipo": "corrosivo",
                    "text": "Lejía"
                  },
                  {
                    "tipo": "corrosivo",
                    "text": "Amoniaco"
                  },
                  {
                    "tipo": "corrosivo",
                    "text": "Jabón"
                  },
                  {
                    "tipo": "corrosivo",
                    "text": "Aguarrás"
                  },
                  {
                    "tipo": "corrosivo",
                    "text": "Gasolina"
                  },
                  {
                    "tipo": "corrosivo",
                    "text": "Alcohol"
                  }
                ]
              }
          ]
      }
  ]
}
```
Para dar formato y validar se pueden emplear herramientas online:
- https://jsonformatter.curiousconcept.com/#
- https://jsonformatter.org/
  
  
  
