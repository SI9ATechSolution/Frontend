Feature: Almacenar información de método de pago
    COMO cinéfilo QUIERO almacenar la información de mi tarjeta PARA realizar nuevas compras de forma más fácil.

  Scenario: Cinéfilo ingresa datos de tarjeta inválidos
    Given el cinéfilo se encuentra en la pasarela de pagos
    When seleccione la opción de guardar método de pago
    And contenga información incorrecta
    Then el sistema retorna un mensaje de que no se guardó el método de pago

  Scenario: Cinéfilo ingresa datos de tarjeta válidos
    Given el cinéfilo se encuentra en la pasarela de pagos
    When seleccione la opción de guardar método de pago
    And contenga información correcta
    Then el sistema retorna un mensaje de realizado correctamente.
