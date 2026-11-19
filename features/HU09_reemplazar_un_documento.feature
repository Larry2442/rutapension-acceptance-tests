Feature: HU09 Reemplazar un documento
  # EP03 Sustento de periodos con documentos - Tipo: Funcional
  Como titular, quiero reemplazar un documento ilegible para que el periodo quede bien sustentado.

  Scenario: Documento reemplazado (normal)
    Given el titular tiene un documento adjunto en un periodo
    When sube una nueva versión del documento
    Then el sistema muestra solo la nueva versión en el periodo

  Scenario: Reemplazo cancelado (alterno)
    Given el titular seleccionó "Reemplazar documento"
    When elige "Cancelar"
    Then el sistema conserva el documento anterior

  Scenario Outline: Formato no permitido (excepcional)
    Given el titular está reemplazando un documento
    When selecciona el archivo "<archivo>"
    Then el sistema muestra el mensaje "Solo se aceptan archivos PDF o JPG"

    Examples:
      | archivo                |
      | boleta_1995.docx       |
      | constancia.png         |
      | planilla_2003.xlsx     |
