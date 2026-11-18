Feature: HU23 Recibir mensajes en lenguaje sencillo
  # EP08 Lectura accesible - Tipo: No funcional (usabilidad)
  Como titular, quiero recibir mensajes en lenguaje sencillo para corregir un dato sin ayuda.

  Scenario Outline: Formato incorrecto (normal)
    Given el titular está llenando un formulario
    When ingresa la fecha "<ingresada>"
    Then el sistema muestra el mensaje "Escribe la fecha así: <sugerida>"

    Examples:
      | ingresada  | sugerida   |
      | 1998-03-15 | 15/03/1998 |
      | 15-03-98   | 15/03/1998 |
      | 3/15/1998  | 15/03/1998 |

  Scenario: Campo vacío (alterno)
    Given el titular dejó vacío un campo obligatorio
    When intenta guardar el formulario
    Then el sistema resalta ese campo con el mensaje "Completa este dato"

  Scenario: Falla al guardar (excepcional)
    Given el titular está guardando un formulario
    When se pierde la conexión
    Then el sistema muestra el mensaje "No pudimos guardar. Tus datos siguen aquí"
