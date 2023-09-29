Feature: Editar cuenta de negocio
    COMO propietario QUIERO tener la opción de gestionar una cuenta de negocio afiliada a mi cuenta propietario PARA manejar y alterar datos de mi cuenta negocio

  Scenario: Ingresar a cuenta negocio
    Given el usuario ingreso a la sección “Negocios afiliados”
    And el sistema le muestra todos los negocios
    When elige un “negocio”
    Then el sistema le mostrará toda la información del negocio

  Scenario: Editar a cuenta negocio
    Given el usuario ingreso a un negocio
    And Entonces el sistema le muestra todos los negocios
    When elige la opción “editar negocio”
    Then el sistema le permitirá editar toda la información del negocio
