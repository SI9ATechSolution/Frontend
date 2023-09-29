Feature: Pagar boleto en pasarela
    COMO cinéfilo QUIERO pagar por los boletos de una función reservada PARA verla en el cineclub donde se proyecta.

  Scenario: Cinéfilo ingresa un número de tarjeta de una red de pago no admitida
    Given el cinéfilo se encuentra en la pasarela de pagos
    When ingresa el dato [“número de tarjeta”]
    And este no coincida con el tipo de pago
    Then se mostrará un error en el campo indicando el número inválido.

  Scenario: Cinéfilo ingresa un número de tarjeta de una red de pago admitida
    Given el cinéfilo se encuentra en la pasarela de pagos
    When ingresa el dato [“número de tarjeta”]
    And esta pertenezca a una red de pago válida
    Then se mostrará un indicador en el campo que indique que es válido.

  Scenario: Cinéfilo ingresa datos no admitidos para la tarjeta seleccionada
    Given el cinéfilo se encuentra en la pasarela de pagos
    And ingresa una tarjeta válida
    When ingresa los datos [“datos del titular”, “CCV”, “código postal”, “email”]
    And no cumplan con los criterios de los campos
    Then el sistema no permitirá continuar con la compra

  Scenario: Cinéfilo ingresa datos admitidos para la tarjeta seleccionada
    Given el cinéfilo se encuentra en la pasarela de pagos
    And ingresa una tarjeta válida
    When ingresa los datos [“datos del titular”, “CCV”, “código postal”, “email”]
    And sean correctos
    Then el sistema enviará la información para procesar el pago.

  Scenario: Cinéfilo no cuenta con fondos para la transacción
    Given el cinéfilo ingresó los datos correctos de su tarjeta
    When el sistema procese el pago
    And no cuente con fondos suficientes
    Then retorna a la pantalla un error indicando que ocurrió un error durante la transacción

  Scenario: Cinéfilo cuenta con fondos para la transacción
    Given el cinéfilo ingresó los datos correctos de su tarjeta
    When el sistema procese el pago
    And cuente con fondos suficientes
    Then retorna a la pantalla un mensaje indicando que se procesó la compra correctamente
    And se envía al email un mensaje con el boleto.
