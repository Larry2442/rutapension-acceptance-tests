Feature: HU07 Adjuntar un documento a un periodo
  # EP03 Sustento de periodos con documentos - Tipo: Funcional
  Como titular, quiero adjuntar un documento a un periodo laboral para sustentar ese periodo antes de mi consulta.

  Scenario Outline: Documento adjunto (normal)
    Given el titular tiene un periodo con la etiqueta "Pendiente de sustento"
    When adjunta el archivo "<archivo>" de <peso> MB
    Then el sistema cambia la etiqueta del periodo a "Con documento"

    Examples:
      | archivo                   | peso |
      | boleta_marzo_1990.pdf     | 1.2  |
      | certificado_trabajo.jpg   | 3.5  |
      | liquidacion_2001.pdf      | 9.9  |

  Scenario: Foto desde el celular (alterno)
    Given el titular está adjuntando un documento desde su celular
    When toma una foto de la boleta
    Then el sistema adjunta la foto al periodo en formato JPG

  Scenario Outline: Archivo muy pesado (excepcional)
    Given el titular está adjuntando un documento a un periodo
    When selecciona el archivo "<archivo>" de <peso> MB
    Then el sistema muestra el mensaje "El archivo debe pesar como máximo 10 MB"

    Examples:
      | archivo               | peso |
      | boletas_escaneadas.pdf | 10.1 |
      | foto_alta_calidad.jpg  | 25   |
