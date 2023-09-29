Feature: Contactar a la startup
    COMO visitante de la landing page QUIEROproporcionar mi correo electrónico PARA que los desarrolladores reciban mi retroalimentación, dudas e inquietudes relacionadas con la aplicación

  Scenario: Enviar mensaje a los desarrolladores
    Given el visitante tenga una consulta o comentario relacionado con la aplicación
    When redacte un mensaje y adjunte una dirección de correo electrónico para contactar a los desarrolladores
    Then el sistema remitirá la consulta a los desarrolladores
