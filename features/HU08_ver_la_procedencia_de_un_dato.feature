Feature: HU08 Ver la procedencia de un dato
  # EP03 Sustento de periodos con documentos - Tipo: Funcional
  Como titular, quiero ver de qué documento sale cada dato de un periodo para confiar en la información.

  Scenario Outline: Dato con documento (normal)
    Given el titular tiene un periodo sustentado con "<documento>"
    When abre el detalle del periodo
    Then el sistema muestra "<documento>" junto al dato "<dato>"

    Examples:
      | documento                 | dato            |
      | boleta_marzo_1990.pdf     | Remuneración    |
      | certificado_trabajo.jpg   | Fecha de inicio |

  Scenario: Dato declarado (alterno)
    Given el titular registró un periodo sin documento
    When abre el detalle del periodo
    Then el sistema muestra la etiqueta "Declarado por ti" junto a cada dato

  Scenario: Documento eliminado (excepcional)
    Given el titular eliminó el documento de origen de un periodo
    When abre el detalle del periodo
    Then el sistema cambia la etiqueta de cada dato a "Declarado por ti"
