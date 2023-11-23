Feature: Creación y modificación de películas
    COMO cinéfilo QUIERO ver una lista de películas en la sección correspondiente PARA estar al tanto de los filmes disponibles

  Scenario: Mostrar películas más recientes
    Given soy un cinéfilo
    When ingreso a la sección de películas
    Then debería ver una lista de las películas más recientes

  Scenario: Visualizar detalles de una película
    Given soy un cinéfilo
    When ingreso a la sección de películas
    Then debería ver detalles de cada película

  Scenario: No hay películas
    Given soy un cinéfilo
    When ingreso a la sección de películas y no hay publicaciones disponibles
    Then se muestra un mensaje “No se encontraron peículas”

  Scenario: Problemas de carga de películas
    Given soy un cinéfilo
    When intento acceder a la sección de películas y hay problemas de carga
    Then se muestra un mensaje de error indicando que no se pueden cargar las películas en este momento
