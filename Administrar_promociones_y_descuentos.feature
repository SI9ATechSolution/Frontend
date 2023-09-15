Feature: Administrar promociones y descuentos
    COMO propietario de un cineclub QUIERO crear y administrar promociones y descuentos PARA atraer a más público y aumentar las ventas.

  Scenario: Creación de una Nueva Promoción
    Given que soy el propietario del cineclub y estoy autenticado en la aplicación web.
    When accedo a la sección de promociones y descuentos ""
    Then el sistema muestra la lista actual de promociones y opciones para agregar una nueva promoción.

  Scenario: Agregar Detalles de la Promoción
    Given estoy creando una nueva promoción
    When ingreso los detalles como el nombre, descripción y el tipo de descuento (porcentaje o monto fijo)
    Then el sistema me permite avanzar al siguiente paso para definir las condiciones de la promoción

  Scenario: Definir Condiciones de la Promoción
    Given que estoy creando una nueva promoción
    When elijo las condiciones que activarán la promoción, como seleccionar películas específicas, fechas y horarios
    Then el sistema valida las condiciones y me permite continuar

  Scenario: Establecer Fecha de Vigencia
    Given estoy creando una nueva promoción.
    When selecciono la fecha de inicio y finalización de la promoción.
    Then el sistema registra estas fechas y me permite proceder.

  Scenario: Guardar y Publicar la Promoción
    Given he ingresado todos los detalles de la promoción.
    When reviso la información y estoy satisfecho con la configuración.
    Then el sistema me da la opción de guardar y activar la promoción para que los cinéfilos puedan verla al comprar entradas

  Scenario: Datos Incompletos o Inválidos
    Given estoy creando una nueva promoción.
    When intento avanzar sin haber completado los campos obligatorios o si los datos ingresados son inválidos
    Then el sistema muestra mensajes de error al lado de los campos afectados y no permite continuar hasta que los datos sean corregidos

  Scenario: Promoción Duplicada
    Given que estoy creando una nueva promoción
    And intento crear una promoción con un nombre que ya existe en la base de datos
    Then el sistema me muestra un mensaje indicando que el nombre de la promoción ya está en uso y sugiere elegir un nombre único
