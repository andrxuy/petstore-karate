/**
 * Configuración global de Karate
 * Se ejecuta una vez antes de todos los tests
 */
function fn() {
    var config = {
        // URL base de la API de Petstore
        baseUrl: 'https://petstore.swagger.io/v2'
    };
    return config;
}