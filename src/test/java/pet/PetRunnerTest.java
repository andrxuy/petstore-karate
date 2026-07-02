package pet;

import com.intuit.karate.junit5.Karate;

/**
 * Runner para ejecutar los tests del módulo Pet
 * Genera reportes automáticos en target/karate-reports/
 */
public class PetRunnerTest {

    /**
     * Ejecuta el feature pet-crud.feature
     */
    @Karate.Test
    Karate testPetCrud() {
        return Karate.run("pet-crud").relativeTo(getClass());
    }
}