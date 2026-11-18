Feature: HU26 Cerrar la sesión por inactividad
  # EP09 Protección de datos - Tipo: No funcional (seguridad)
  Como titular, quiero que mi sesión se cierre si la dejo abierta para que nadie vea mi caso en un equipo compartido.

  Scenario Outline: Cierre automático (normal)
    Given el titular tiene la sesión abierta
    When pasan <minutos> minutos sin actividad
    Then el sistema muestra la sesión como "<estado>"

    Examples:
      | minutos | estado  |
      | 10      | Abierta |
      | 15      | Cerrada |

  Scenario: Aviso previo (alterno)
    Given el titular lleva 14 minutos sin actividad
    When falta un minuto para el cierre
    Then el sistema muestra el aviso "Tu sesión se cerrará en 1 minuto"

  Scenario: Formulario sin guardar (excepcional)
    Given el titular dejó un formulario a medias
    When se cierra la sesión por inactividad
    Then el sistema guarda un borrador del formulario
