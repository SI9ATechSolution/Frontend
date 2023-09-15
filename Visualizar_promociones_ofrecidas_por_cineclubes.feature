Feature: Visualizar promociones ofrecidas por cineclubes
    COMO cinéfilo QUIERO contar con una sección que me permita ver cuáles son las promociones que ofrecen los cineclubes PARA conocer acerca de los descuentos, cupones y paquetes disponibles

  Scenario: Cinéfilo ingresa a la sección “promociones”
    Given el usuario se encuentre en la landing page
    When presione el botón con el enunciado “Promociones” ubicado en la barra de navegación
    Then será redirigido a la sección “promociones”, donde podrá visualizar los beneficios ofrecidos los cineclubes

  Scenario: No hay promociones disponibles
    Given el cinéfilo se encuentre en la sección “promociones”
    When no haya promociones disponibles
    Then se mostrará un mensaje de error indicando que “No se encontraron promociones”

  Scenario: Problemas de carga
    Given el cinéfilo se encuentre en la sección “promociones”
    When intente acceder a la sección de publicaciones y haya problemas de carga
    Then se mostrará un mensaje de error indicando que “No se pueden cargar las publicaciones en este momento”
