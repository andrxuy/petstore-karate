  Feature: Gestión de mascotas en Swagger Petstore
    # Prueba el flujo completo CRUD (Create, Read, Update, Delete) de mascotas

  Background:
    # Usa la URL base configurada en karate-config.js
  * url baseUrl

  Scenario: CRUD completo de una mascota
    # ========== CREATE ==========
    # Crear una nueva mascota usando datos del archivo new-pet.json
  Given path 'pet'
  And def newPetData = read('new-pet.json')
  And request newPetData
  When method post
  Then status 200
    # Verificar que la respuesta contiene los datos correctos
  And match response.name == newPetData.name
  And match response.status == newPetData.status
    # Guardar el ID generado para usarlo en los siguientes pasos
  And def createdId = response.id

    # ========== READ ==========
    # Consultar la mascota creada usando su ID
  Given path 'pet', createdId
  When method get
  Then status 200
    # Verificar que los datos coinciden con los enviados
  And match response.id == createdId
  And match response.name == newPetData.name

    # ========== UPDATE ==========
    # Actualizar la mascota con nuevos datos del archivo update-data.json
  Given path 'pet'
  And def updateData = read('update-data.json')
    # Asignar el ID de la mascota existente
  And set updateData.id = createdId
  And request updateData
  When method put
  Then status 200
    # Verificar que la actualización fue exitosa
  And match response.id == createdId
  And match response.name == updateData.name
  And match response.status == updateData.status

    # ========== SEARCH ==========
    # Buscar mascotas por status para verificar que la actualización se reflejó
  Given path 'pet', 'findByStatus'
  And param status = updateData.status
  When method get
  Then status 200
    # Verificar que la respuesta es un array
  And match response == '#[]'
    # Verificar que todas las mascotas retornadas tienen el status esperado
  And match each response contains { status: '#string' }