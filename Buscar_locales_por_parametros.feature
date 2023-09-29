Feature: Buscar locales por parámetros
    COMO cinéfilo QUIERO buscar locales por parámetros PARA visualizar su información

  Scenario: Buscar local por nombre
    Given el usuario selecciono la barra de búsqueda
    When ingresa el nombre del local
    Then el sistema le mostrará el local solicitado

  Scenario: No existe el local
    Given el usuario selecciono la barra de búsqueda
    When ingresa nombre del local
    Then el sistema le mostrará un texto indicando que no figura el local
