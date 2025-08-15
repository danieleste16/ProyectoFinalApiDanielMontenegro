@msjsonplaceholder
Feature: Pruebas de API con Karate

  @CrearDatosJson
  Scenario: Creación de usuario por archivo
    * configure ssl = true
    * def body = read('classpath:data/dataCreacion.json')
    Given url 'http://jsonplaceholder.typicode.com/posts'
    And request body
    When method POST
    Then status 201
    And match response.title == 'Archivo 1'

  @actualizarCompleta
  Scenario: Actualización de usuario existente
    * configure ssl = true
    Given url 'http://jsonplaceholder.typicode.com/posts/11'
    And request {"id":11, "title": "Archivo 11","body": "Test 11","userId": 101}
    When method PUT
    Then status 200
    And match response.id == 11
    And match response.title == 'Archivo 11'

  @eliminar
  Scenario: Eliminación de usuario existente
    * configure ssl = true
    Given url 'http://jsonplaceholder.typicode.com/posts/11'
    When method DELETE
    Then status 200

  @Fallido
  Scenario: Post no encontrado
    * configure ssl = true
    Given url 'https://jsonplaceholder.typicode.com/posts/11n'
    When method GET
    Then status 404

  @LogFallido
  Scenario: Post no encontrado que falla
    * configure ssl = true
    Given url 'https://jsonplaceholder.typicode.com/posts/11'
    When method GET
    Then status 404