Feature: Buscar películas por parámetros
    COMO cinéfilo QUIERO buscar locales por parámetros PARA visualizar su información

  Scenario: Buscar película por nombre
    Given el usuario seleccionó la barra de búsqueda
    When ingresa el nombre de la película
    Then el sistema le mostrará la película buscada
