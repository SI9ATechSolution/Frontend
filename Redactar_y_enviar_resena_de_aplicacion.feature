Feature: Redactar y enviar reseña de aplicación


  Scenario: Usuario realiza una transacción
    Given un cinéfilo haya comprado una entrada o promoción
    When se haya validado la transacción
    Then se abrirá un mensaje emergente consultando al usuario si desea redactar un comentario

  Scenario: Cinéfilo desea publicar reseña
    Given el cinéfilo presione el botón que confirma su intención de dejar un comentario
    When termine de redactar su opinión en la casilla designada
    And presione el botón “enviar”
    Then su mensaje será enviado al sistema.

  Scenario: Cinéfilo intenta enviar reseña incompleta
    Given el cinéfilo no haya escrito un mensaje en la casilla designada para reseñas
    When presione el botón “enviar”
    Then se mostrará un mensaje de error solicitándole redactar un mensaje antes de enviar
