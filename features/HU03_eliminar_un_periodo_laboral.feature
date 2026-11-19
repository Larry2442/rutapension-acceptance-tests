Feature: HU03 Eliminar un periodo laboral
  # EP01 Registro de periodos laborales - Tipo: Funcional
  Como titular, quiero eliminar un periodo registrado por error para que mi lista refleje mis trabajos reales.

  Scenario Outline: Periodo eliminado (normal)
    Given el titular tiene <total> periodos registrados
    When confirma la opción "Eliminar periodo" en uno de ellos
    Then el sistema muestra <restantes> periodos en la vista de periodos

    Examples:
      | total | restantes |
      | 3     | 2         |
      | 1     | 0         |

  Scenario: Eliminación cancelada (alterno)
    Given el titular seleccionó "Eliminar periodo"
    When elige "Cancelar"
    Then el sistema conserva el periodo sin cambios

  Scenario: Sin conexión (excepcional)
    Given el titular perdió la conexión a Internet
    When confirma "Eliminar periodo"
    Then el sistema muestra el mensaje "No pudimos eliminar el periodo. Revisa tu conexión"
