Feature: HU02 Editar un periodo laboral
  # EP01 Registro de periodos laborales - Tipo: Funcional
  Como titular, quiero corregir los datos de un periodo para mantener mi historia laboral exacta.

  Scenario Outline: Periodo actualizado (normal)
    Given el titular tiene registrado un periodo en "<empleador_anterior>"
    When cambia el nombre del empleador a "<empleador_nuevo>"
    Then el sistema muestra el periodo con el nombre "<empleador_nuevo>"

    Examples:
      | empleador_anterior      | empleador_nuevo                |
      | Textil San Martin       | Textil San Martín S.A.         |
      | Muni Los Olivos         | Municipalidad de Los Olivos    |

  Scenario: Edición cancelada (alterno)
    Given el titular está editando un periodo
    When elige "Cancelar"
    Then el sistema conserva los datos anteriores del periodo

  Scenario Outline: Campo obligatorio vacío (excepcional)
    Given el titular está editando un periodo
    When deja vacío el campo "<campo>"
    Then el sistema muestra el mensaje "<mensaje>"

    Examples:
      | campo             | mensaje                                    |
      | Fecha de inicio   | Ingresa la fecha de inicio del periodo     |
      | Empleador         | Ingresa el nombre del empleador            |
