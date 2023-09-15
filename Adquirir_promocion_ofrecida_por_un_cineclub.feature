Feature: Adquirir promoción ofrecida por un cineclub


  Scenario: Cinéfilo desea adquirir una promoción desde la sección “promociones”
    Given el usuario se encuentre en la sección “promociones”
    When presione alguna de las promociones listadas
    Then será redirigido a una pasarela de pago desde la cual podrá ingresar los datos necesarios para efectuar la compra de la promoción elegida

  Scenario: Cinéfilo desea adquirir una promoción vencida
    Given el usuario se encuentre en la sección “promociones”
    When presione alguna de las promociones listadas
    And el tiempo de disponibilidad de la promoción haya caducado al momento de llenar la información necesaria para efectuar la compra
    Then se mostrará un mensaje de error indicando que “La promoción ya no se encuentra disponible”

  Scenario: Cinéfilo ingresa un número de tarjeta de una red de pago no admitida
    Given el cinéfilo se encuentra en la pasarela de pagos
    When ingresa el dato [“número de tarjeta”]
    And este no coincida con el tipo de pago
    Then se mostrará un error en el campo indicando el número inválido.

  Scenario: Cinéfilo ingresa un número de tarjeta de una red de pago admitida
    Given Dado que el cinéfilo se encuentra en la pasarela de pagos
    When ingresa el dato [“número de tarjeta”]
    And esta pertenezca a una red de pago válida
    Then se mostrará un indicador en el campo que indique que es válido.

  Scenario: Cinéfilo ingresa datos no admitidos para la tarjeta seleccionada
    Given el cinéfilo se encuentra en la pasarela de pagos
    And ingresa una tarjeta válida
    When ingresa los datos [“datos del titular”, “CCV”, “código postal”, “email”]
    And no cumplan con los criterios de los campos
    Then el sistema no permitirá continuar con la compra.

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
    And Y se envía al email un mensaje con el boleto.
