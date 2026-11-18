Feature: HU22 Ajustar el tamaño de la letra
  # EP08 Lectura accesible - Tipo: No funcional (usabilidad)
  Como titular, quiero ajustar el tamaño de la letra para leer sin esfuerzo.

  Scenario Outline: Letra ampliada (normal)
    Given el titular está en cualquier pantalla con letra de <inicial> px
    When selecciona el botón "A+" <veces> veces
    Then el sistema muestra el texto en <final> px sin cortar el contenido

    Examples:
      | inicial | veces | final |
      | 16      | 1     | 20    |
      | 16      | 2     | 24    |
      | 24      | 2     | 32    |

  Scenario: Preferencia guardada (alterno)
    Given el titular amplió la letra a 24 px
    When vuelve a ingresar a la plataforma
    Then el sistema conserva el tamaño de 24 px

  Scenario: Tamaño máximo (excepcional)
    Given el titular tiene la letra en el tamaño máximo de 32 px
    When selecciona el botón "A+"
    Then el sistema mantiene el texto en 32 px
