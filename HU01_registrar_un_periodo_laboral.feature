Feature: HU01 Registrar un periodo laboral
  # EP01 Registro de periodos laborales - Tipo: Funcional
  Como titular, quiero registrar un periodo laboral para tener mis trabajos en un solo lugar.

  Scenario Outline: Periodo registrado (normal)
    Given el titular está en el formulario "Nuevo periodo"
    When guarda el periodo en "<empleador>" desde "<inicio>" hasta "<fin>"
    Then el sistema muestra el periodo de "<empleador>" en la vista de periodos

    Examples:
      | empleador                    | inicio     | fin        |
      | Textil San Martín S.A.       | 01/03/1985 | 31/12/1992 |
      | Municipalidad de Los Olivos  | 15/01/1993 | 30/06/2001 |
      | Transportes Rímac S.R.L.     | 01/08/2001 | 31/05/2010 |

  Scenario: Trabajo actual (alterno)
    Given el titular está registrando su trabajo actual
    When marca la opción "Trabajo aquí actualmente"
    Then el sistema guarda el periodo con la fecha de fin "En curso"

  Scenario Outline: Fechas inválidas (excepcional)
    Given el titular registra un periodo que inicia el "<inicio>"
    When ingresa la fecha de fin "<fin>"
    Then el sistema muestra el mensaje "La fecha de fin debe ser posterior a la fecha de inicio"

    Examples:
      | inicio     | fin        |
      | 01/03/1990 | 01/01/1989 |
      | 15/05/2000 | 14/05/2000 |
      | 01/08/2005 | 31/07/2005 |
