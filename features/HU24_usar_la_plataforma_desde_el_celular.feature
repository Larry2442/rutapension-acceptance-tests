Feature: HU24 Usar la plataforma desde el celular
  # EP08 Lectura accesible - Tipo: No funcional (portabilidad)
  Como titular, quiero usar la plataforma desde mi celular para prepararme con el dispositivo que tenga a la mano.

  Scenario Outline: Pantalla de celular (normal)
    Given el titular ingresa desde un dispositivo de <ancho> px de ancho
    When abre la vista de periodos
    Then el sistema adapta la pantalla sin desplazamiento horizontal

    Examples:
      | ancho |
      | 360   |
      | 412   |
      | 768   |

  Scenario: Botones táctiles (alterno)
    Given el titular ingresa desde un celular
    When abre cualquier formulario
    Then el sistema muestra botones de al menos 44 x 44 px

  Scenario: Conexión lenta (excepcional)
    Given el titular usa su celular con una conexión 3G
    When abre la vista de periodos
    Then el sistema carga la vista en menos de 5 segundos
